import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/repository/location_repository.dart';
import 'package:dayliff/data/repository/notifications_messages.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/home/order_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/model/trip_dtos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'state.dart';

class ProcessingCubit extends Cubit<ProcessingState> {
  final CheckoutService _service = service<CheckoutService>();
  final OrderBloc _orderBloc;
  final CheckOutBloc _checkOutBloc;
  final LocationStreamer _locationStreamer;
  ProcessingCubit(this._orderBloc, this._checkOutBloc, this._locationStreamer)
      : super(const ProcessingState());

  Trip _getTripById(int id) {
    return _orderBloc.state.trips.firstWhere((element) => element.id == id);
  }

  Order _getOrderById(int id) {
    final orders = _orderBloc.state.trips.expand((element) => element.orders);
    return orders.firstWhere((element) => element.orderId == id);
  }

  // Start trip
  void startTrip(int tripId) async {
    // Find trip
    final trip = _getTripById(tripId);

    // Mark trip as active
    emit(state.copyWith(status: ServiceStatus.submissionInProgress));

    final LatLng? currentLocation = _locationStreamer.currentLocation;

    // send coordinates
    final res = await _service.startTrip(
      payload: StartTripRequest(
        tripId: trip.id,
        coordinates: LatLng_(
            latitude: currentLocation?.latitude,
            longitude: currentLocation?.longitude),
        status: TripStatus.ACTIVE,
        startTime: DateTime.now(),
      ),
    );

    // Handle response
    res.when(onError: (error) {
      emit(
        state.copyWith(
            status: ServiceStatus.submissionFailure,
            message: AppMessage(message: error.error, tone: MessageTone.error)),
      );
    }, onSuccess: (data) {
      // Update trip
      _orderBloc.add(UpdateTrip(
          trip: _getTripById(tripId).copyWith(status: TripStatus.ACTIVE)));
      // Update state
      emit(
        state.copyWith(
            status: ServiceStatus.submissionSuccess,
            message: AppMessage(
              message: data.message,
              tone: MessageTone.success,
            ),
            startTripSuccess: true),
      );
    });
  }

  // Start navigation
  void startNavigation(int id) async {
    final order = _getOrderById(id);
    final trip = _getTripById(order.trip);

    if (trip.orders.where((e) => e.status == OrderStatus.ACTIVE).isNotEmpty) {
      emit(
        state.copyWith(
          message: AppMessage(
              message: "You already have an incomplete active order.",
              tone: MessageTone.warning),
        ),
      );
    } else {
      emit(state.copyWith(status: ServiceStatus.submissionInProgress));

      final LatLng? currentLocation = _locationStreamer.currentLocation;

      // send coordinates
      final res = await _service.startNavigation(
        payload: StartNavigationRequest(
          orderId: id,
          coordinates: LatLng_(
              latitude: currentLocation?.latitude,
              longitude: currentLocation?.longitude),
          status: OrderStatus.ACTIVE,
          timestartnavigation: DateTime.now(),
        ),
      );

      // Handle response
      res.when(onError: (error) {
        emit(
          state.copyWith(
              status: ServiceStatus.submissionFailure,
              message:
                  AppMessage(message: error.error, tone: MessageTone.error)),
        );
      }, onSuccess: (data) {
        emit(
          state.copyWith(
              status: ServiceStatus.submissionSuccess,
              message: AppMessage(message: data, tone: MessageTone.success),
              startNavigationSuccess: true),
        );

        //  Update order
        _orderBloc.add(
            UpdateOrder(order: order.copyWith(status: OrderStatus.ACTIVE)));

        // Notify the customer
        MessageNotificationsRepository.instance.sendTextMessage(
            order.recipientPhone,
            """Exciting news! Your delivery is now on its way to your doorstep.
For real-time tracking, click [Tracking Link] to monitor the progress of your package.
Thank you for choosing Davis & Shirtliff we appreciate your trust in our service.""");
      });
    }
  }

  // Begin handover
  void beginHandover(int id) async {
    emit(state.copyWith(status: ServiceStatus.submissionInProgress));

    final LatLng? currentLocation = _locationStreamer.currentLocation;

    final res = await _service.startHandover(
      payload: StartHandoverRequest(
        coordinates: LatLng_(
            latitude: currentLocation?.latitude,
            longitude: currentLocation?.longitude),
        status: OrderStatus.ACTIVE,
        orderId: id,
        time: DateTime.now(),
      ),
    );

    // Handle response
    res.when(onError: (error) {
      emit(
        state.copyWith(
            status: ServiceStatus.submissionFailure,
            message: AppMessage(message: error.error, tone: MessageTone.error)),
      );
    }, onSuccess: (data) {
      // add update to state
      emit(
        state.copyWith(
            status: ServiceStatus.submissionSuccess,
            message: AppMessage(message: data, tone: MessageTone.success),
            serviceStarted: true),
      );

      // TODO! Add status for handover
      //  _orderBloc
      //     .add(UpdateOrder(order: order.copyWith(status: OrderStatus.ACTIVE)));
    });
  }

  void otpValidation(String code, int id, CheckoutEvent checkoutEvent) async {
    emit(
      state.copyWith(
        status: ServiceStatus.submissionInProgress,
        message: AppMessage(
          message: "Verifying otp...",
          tone: MessageTone.loading,
        ),
      ),
    );

    final res = await _service.validateOtp(code, id);
    res.when(onError: (error) {
      emit(
        state.copyWith(
            status: ServiceStatus.submissionFailure,
            message: AppMessage(message: error.error, tone: MessageTone.error)),
      );
    }, onSuccess: (data) {
      emit(state.copyWith(
          status: ServiceStatus.submissionSuccess,
          message: AppMessage(message: data, tone: MessageTone.success)));
      _checkOutBloc.add(checkoutEvent);
    });
  }

  // Validate customer
  void orderConfirmationUpdate(
      OrderConfirmation confirmation, CheckoutEvent checkoutEvent,
      {bool isComplete = false, int retries = 5}) async {
    emit(
      state.copyWith(
          status: ServiceStatus.submissionInProgress,
          message:
              AppMessage(message: "Please wait...", tone: MessageTone.loading)),
    );
    final res = await _service.confirmDelivery(confirmation: confirmation);
    res.when(onError: (error) {
      if (retries == 0) {
        emit(
          state.copyWith(
              status: ServiceStatus.submissionFailure,
              message:
                  AppMessage(message: error.error, tone: MessageTone.error)),
        );
      } else {
        orderConfirmationUpdate(confirmation, checkoutEvent,
            isComplete: isComplete, retries: retries -= 1);
      }
    }, onSuccess: (data) async {
      emit(
        state.copyWith(
          status: ServiceStatus.submissionSuccess,
          message: AppMessage(message: data, tone: MessageTone.success),
        ),
      );

      // Emit checkout event
      if (isComplete) {
        completeOrder(confirmation.orderId);
      }
      // Confirm checkout
      _checkOutBloc.add(checkoutEvent);
    });
  }

  void completeOrder(int orderId, {int retries = 5}) async {
    final order = _getOrderById(orderId);
    // Mark the order as complete
    final _res = await _service.updateOrder(
      orderId,
      OrderStatus.COMPLETED,
    );

    _res.when(onError: (error) {
      if (retries == 0) {
        emit(
          state.copyWith(
            status: ServiceStatus.submissionFailure,
            message: AppMessage(
              message: error.error,
              tone: MessageTone.error,
            ),
          ),
        );
      } else {
        completeOrder(orderId, retries: retries -= 1);
      }
    }, onSuccess: (data) {
      // Update the order
      _orderBloc.add(
        UpdateOrder(
          order: order.copyWith(status: OrderStatus.COMPLETED),
        ),
      );
      // Get trip after update
      var trip = _getTripById(order.trip);

      // Update trip
      trip = trip.copyWith(
          orders: trip.orders
              .map((e) => e.orderId == order.orderId
                  ? order.copyWith(status: OrderStatus.COMPLETED)
                  : e)
              .toList());
      _orderBloc.add(UpdateTrip(trip: trip));

      // Complete trip
      final bool isAllComplete =
          trip.orders.every((order) => order.status == OrderStatus.COMPLETED);

      if (isAllComplete) {
        //  Complete trip
        completeTrip(trip.id, TripStatus.COMPLETED);
      }
    });
  }

  void completeTrip(int id, TripStatus status, {int retries = 5}) async {
    debugPrint("Complete trip function $id, $status");
    final res = await _service.updateTrip(id, status);
    res.when(onError: (error) {
      if (retries == 0) {
        emit(
          state.copyWith(
            status: ServiceStatus.submissionFailure,
            message: AppMessage(
              message: error.error,
              tone: MessageTone.error,
            ),
          ),
        );
      } else {
        completeTrip(id, status, retries: retries -= 1);
      }
    }, onSuccess: (data) {
      debugPrint("Trip completed successfully");
      emit(
        state.copyWith(
            status: ServiceStatus.submissionSuccess,
            message: AppMessage(
              message: data,
              tone: MessageTone.success,
            ),
            completeTripSuccess: true),
      );

      // Update trip
      _orderBloc.add(
        UpdateTrip(
          trip: _getTripById(id).copyWith(status: TripStatus.COMPLETED),
        ),
      );

      // Checkout complete
      _checkOutBloc.add(StepComplete());

      // Refresh trips
      _orderBloc.add(RefreshRoutes());
    });
  }
}
