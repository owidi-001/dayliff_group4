import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/model/trip_dtos.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'state.dart';

class ProcessingCubit extends Cubit<ProcessingState> {
  final CheckoutService _service = service<CheckoutService>();
  final OrderBloc _orderBloc;
  ProcessingCubit(this._orderBloc) : super(const ProcessingState());

  // Start trip
  void startTrip(int tripId) async {
    final trip =
        _orderBloc.state.trips.firstWhere((element) => element.id == tripId);
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
          status: TripStatus.Active),
    );
    // Handle response
    res.when(onError: (error) {
      emit(
        state.copyWith(
            status: ServiceStatus.submissionFailure,
            message: AppMessage(message: error.error, tone: MessageTone.error)),
      );
    }, onSuccess: (data) {
      // add trip to state
      emit(
        state.copyWith(
          status: ServiceStatus.loadingSuccess,
          selectedTrip: trip.copyWith(status: TripStatus.Active),
          message: AppMessage(message: data.message, tone: MessageTone.success),
        ),
      );
      _orderBloc
          .add(UpdateTrip(trip: trip.copyWith(status: TripStatus.Active)));
    });
  }

  // Order selected
  void selectOrder(int id) {
    // add selected to state
    emit(state.copyWith(
        selectedOrder: state.selectedTrip!.orders
            .firstWhere((element) => element.orderId == id)));
  }

  // Start navigation
  void startNavigation(int id) async {
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
    // start coordinates
    final res = await _service.startNavigation(
      payload: StartNavigationRequest(
          orderId: order.orderId!,
          coordinates: LatLng_(
              latitude: coordinates!.latitude,
              longitude: coordinates!.longitude),
          status: OrderStatus.Active),
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
          selectedOrder: order.copyWith(status: OrderStatus.Active),
          message: AppMessage(message: data.message, tone: MessageTone.success),
        ),
      );

      // Update order in routes
      _orderBloc.add(UpdateOrder(order: order));
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
            status: OrderStatus.Active,
            orderId: id));

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
          selectedOrder: order.copyWith(status: OrderStatus.Active),
          message: AppMessage(message: data.message, tone: MessageTone.success),
        ),
      );

      // Update order in routes
      _orderBloc.add(UpdateOrder(order: order));
    });
  }

  // Validate customer
  void orderConfirmationUpdate(OrderConfirmation confirmation) async {
    emit(
      state.copyWith(status: ServiceStatus.submissionInProgress),
    );
    final res = await _service.confirmDelivery(confirmation: confirmation);
    res.when(onError: (error) {
      emit(state.copyWith(status: ServiceStatus.loadingFailure));
    }, onSuccess: (data) {
      emit(state.copyWith(status: ServiceStatus.loadingSuccess));
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
