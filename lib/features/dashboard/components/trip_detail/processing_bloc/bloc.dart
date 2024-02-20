import 'package:dayliff/data/models/messages/app_message.dart';
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
import 'package:location/location.dart';

part 'state.dart';

class ProcessingCubit extends Cubit<ProcessingState> {
  final CheckoutService _service = service<CheckoutService>();
  final OrderBloc _orderBloc;
  final CheckOutBloc _checkOutBloc;
  ProcessingCubit(this._orderBloc, this._checkOutBloc)
      : super(const ProcessingState());

  // Start trip
  void startTrip(int tripId) async {
    // select trip
    selectTrip(tripId);
    // Find trip
    final trip =
        _orderBloc.state.trips.firstWhere((element) => element.id == tripId);
    // Select trip
    emit(state.copyWith(status: ServiceStatus.submissionInProgress));
    LatLng coordinates = LatLng(trip.origin!.lat!, trip.origin!.long!);
    // Set to current location
    await getCurrentLocation().then((value) {
      if (value != null) {
        coordinates = LatLng(value.latitude!, value.longitude!);
      }
    });
    // start coordinates
    final res = await _service.startTrip(
      payload: StartTripRequest(
        tripId: trip.id,
        coordinates: LatLng_(
            latitude: coordinates.latitude, longitude: coordinates.longitude),
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
      // Add trip to state
      emit(
        state.copyWith(
            status: ServiceStatus.submissionSuccess,
            selectedTrip: trip.copyWith(status: TripStatus.ACTIVE),
            message: AppMessage(
              message: data.message,
              tone: MessageTone.success,
            ),
            startTripSuccess: true),
      );
      _orderBloc
          .add(UpdateTrip(trip: trip.copyWith(status: TripStatus.ACTIVE)));
    });
  }

  // Order selected
  void selectOrder(int id) {
    // add selected to state
    emit(state.copyWith(
        selectedOrder: state.selectedTrip!.orders
            .firstWhere((element) => element.orderId == id)));
  }

// Trip selected
  void selectTrip(int id) {
    // add selected to state
    emit(state.copyWith(
        selectedTrip:
            _orderBloc.state.trips.firstWhere((element) => element.id == id)));
  }

  // Start navigation
  void startNavigation(int id) async {
    final Order order = state.selectedTrip!.orders
        .firstWhere((element) => element.orderId == id);

    emit(state.copyWith(status: ServiceStatus.submissionInProgress));
    LatLng? coordinates;
    if (order.destination != null) {
      coordinates = LatLng(order.destination!.lat!, order.destination!.long!);
    }
    try {
      // Set to current location
      await getCurrentLocation().then((value) {
        if (value != null) {
          coordinates = LatLng(value.latitude!, value.longitude!);
        }
      });
    } catch (e) {
      debugPrint(e.toString());
    }

    // start coordinates
    final res = await _service.startNavigation(
      payload: StartNavigationRequest(
          orderId: order.orderId,
          coordinates: LatLng_(
              latitude: coordinates?.latitude,
              longitude: coordinates?.longitude),
          status: OrderStatus.ACTIVE,
          timestartnavigation: DateTime.now()),
    );
    // Handle response
    res.when(onError: (error) {
      emit(
        state.copyWith(
            status: ServiceStatus.submissionFailure,
            message: AppMessage(message: error.error, tone: MessageTone.error)),
      );
    }, onSuccess: (data) {
      emit(
        state.copyWith(
            status: ServiceStatus.submissionSuccess,
            selectedOrder: order.copyWith(status: OrderStatus.ACTIVE),
            message: AppMessage(message: data, tone: MessageTone.success),
            startNavigationSuccess: true),
      );

      //  Update routes in the background
      _orderBloc.add(RefreshRoutes());
      // Notify the customer
      MessageNotificationsRepository.instance.sendTextMessage(
          order.customerPhone,
          """Exciting news! Your delivery is now on its way to your doorstep. Our team is committed to ensuring a swift and secure delivery experience for you.
For real-time tracking, click [Tracking Link] to monitor the progress of your package.
Thank you for choosing Davis & Shirtliff we appreciate your trust in our service.""");
    });
  }

  // Begin handover
  void beginHandover(int id) async {
    final Order order = state.selectedTrip!.orders
        .firstWhere((element) => element.orderId == id);

    emit(state.copyWith(status: ServiceStatus.submissionInProgress));
    LatLng? coordinates;
    // Set to current location
    await getCurrentLocation().then((value) {
      if (value != null) {
        coordinates = LatLng(value.latitude!, value.longitude!);
      }
    });

    final res = await _service.startHandover(
      payload: StartHandoverRequest(
          coordinates: LatLng_(
              latitude: coordinates?.latitude,
              longitude: coordinates?.longitude),
          status: OrderStatus.ACTIVE,
          orderId: id,
          time: DateTime.now()),
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
            selectedOrder: order.copyWith(status: OrderStatus.ACTIVE),
            message: AppMessage(message: data, tone: MessageTone.success),
            serviceStarted: true),
      );

      // TODO! Check this
      // Update order in routes
      // _orderBloc.add(UpdateOrder(order: order));
      _orderBloc.add(RefreshRoutes());
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
      {bool isComplete = false}) async {
    emit(
      state.copyWith(
          status: ServiceStatus.submissionInProgress,
          message:
              AppMessage(message: "Please wait...", tone: MessageTone.loading)),
    );
    final res = await _service.confirmDelivery(confirmation: confirmation);
    res.when(onError: (error) {
      emit(
        state.copyWith(
            status: ServiceStatus.submissionInProgress,
            message: AppMessage(message: error.error, tone: MessageTone.error)),
      );
    }, onSuccess: (data) {
      emit(
        state.copyWith(
          status: ServiceStatus.submissionSuccess,
          message: AppMessage(message: data, tone: MessageTone.success),
        ),
      );

      // Emit chekout event
      if (isComplete) {
        // Mark the order as complete
        _service.updateOrder(confirmation.orderId, OrderStatus.COMPLETED);
        // Update the order
        // var order = state.selectedTrip!.orders
        //     .firstWhere((element) => element.orderId == confirmation.orderId);
        // order = order.copyWith(status: OrderStatus.COMPLETED);
        emit(state.copyWith(
            selectedOrder:
                state.selectedOrder!.copyWith(status: OrderStatus.COMPLETED)));
        // update order in trip
        var trip = state.selectedTrip!.copyWith(
            orders: state.selectedTrip!.orders
                .map((e) => e.orderId == state.selectedOrder!.orderId
                    ? state.selectedOrder!
                    : e)
                .toList());
        // update state
        emit(state.copyWith(selectedTrip: trip));

        if (state.selectedTrip!.orders
            .every((order) => order.status == OrderStatus.COMPLETED)) {
          debugPrint(
              "All orders in trip: ${state.selectedTrip?.id} is complete");
          completeTrip(state.selectedTrip!.id, TripStatus.COMPLETED);
        }

        // Update trip
        _orderBloc.add(UpdateTrip(
            trip: state.selectedTrip!.copyWith(status: TripStatus.COMPLETED)));
        _orderBloc.add(RefreshRoutes());
      }
      // Confirm checkout
      _checkOutBloc.add(checkoutEvent);
    });
  }

  void completeTrip(int id, TripStatus status) async {
    debugPrint("Complete trip function $id, $status");
    final res = await _service.updateTrip(id, status);
    res.when(onError: (error) {
      emit(
        state.copyWith(
          status: ServiceStatus.submissionFailure,
          message: AppMessage(
            message: error.error,
            tone: MessageTone.error,
          ),
        ),
      );
    }, onSuccess: (data) {
      debugPrint("Trip completed successfully");
      emit(
        state.copyWith(
          status: ServiceStatus.submissionSuccess,
          message: AppMessage(message: data, tone: MessageTone.success),
        ),
      );
    });
    debugPrint("Refreshing routes");
    // Refresh trips
    _orderBloc.add(RefreshRoutes());
  }
}

Future<LocationData?> getCurrentLocation() async {
  Location location = Location();
  location.getLocation().then((location) {
    return location;
  });
  return null;
}
