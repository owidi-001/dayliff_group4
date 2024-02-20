import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
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
          orderId: order.orderId!,
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
              latitude: coordinates!.latitude,
              longitude: coordinates!.longitude),
          status: OrderStatus.ACTIVE,
          orderId: id),
    );

    // Handle response
    res.when(onError: (error) {
      emit(
        state.copyWith(
            message: AppMessage(message: error.error, tone: MessageTone.error)),
      );
    }, onSuccess: (data) {
      // add update to state
      emit(
        state.copyWith(
          selectedOrder: order.copyWith(status: OrderStatus.ACTIVE),
          message: AppMessage(message: data.message, tone: MessageTone.success),
        ),
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
      OrderConfirmation confirmation, CheckoutEvent checkoutEvent) async {
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
      emit(state.copyWith(
          status: ServiceStatus.submissionSuccess,
          message: AppMessage(message: data, tone: MessageTone.success)));

      // Emit chekout event
      if (checkoutEvent == StepComplete()) {
        // Update the order
        var order = state.selectedTrip!.orders
            .firstWhere((element) => element.orderId == confirmation.orderId);
        order = order.copyWith(status: OrderStatus.COMPLETED);

        if (state.selectedTrip!.orders
            .every((order) => order.status == OrderStatus.COMPLETED)) {
          completeTrip(state.selectedTrip!.id, TripStatus.COMPLETED);
        }
        // TODO! Check this
        // Update in state
        // _orderBloc.add(
        //     UpdateOrder(order: order.copyWith(status: OrderStatus.COMPLETED)));

        // Update trip
        // _orderBloc.add(UpdateTrip(trip: state.selectedTrip!));
        _orderBloc.add(RefreshRoutes());
      }
      // Confirm checkout
      _checkOutBloc.add(checkoutEvent);
    });
  }

  void completeTrip(int id, TripStatus status) async {
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
      emit(
        state.copyWith(
          status: ServiceStatus.submissionSuccess,
          message: AppMessage(message: data, tone: MessageTone.success),
        ),
      );
    });
  }
}

Future<LocationData?> getCurrentLocation() async {
  Location location = Location();
  location.getLocation().then((location) {
    return location;
  });
  return null;
}
