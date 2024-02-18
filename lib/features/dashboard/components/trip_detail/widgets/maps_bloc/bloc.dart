import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/repository/maps_repo.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

part 'events.dart';
part 'state.dart';

// Bloc
class MapsControllerBloc extends Bloc<MapsEvent, MapsState> {
  late AddressService _addressService;

  MapsControllerBloc() : super(const MapsState()) {
    _addressService = service<AddressService>();

    Future<LocationData> setLocation() async {
      Location location = Location();
      return await location.getLocation().then((location) {
        return location;
      });
    }

// Create a marker for a given point
    buildMarker(LatLng position, onTapEvent, BitmapDescriptor? descriptor) {
      return Marker(
        markerId: MarkerId("${position.latitude}${position.longitude}"),
        icon: descriptor ?? BitmapDescriptor.defaultMarker,
        position: position,
        onTap: () {
          // Open to order details
          onTapEvent();
        },
        infoWindow: const InfoWindow(
            //  Add title and
            ),
      );
    }

// Initialize state
    on<StartMapsEvent>((event, emit) async {
      final startPointMarker = buildMarker(
          LatLng(event.pool.origin!.lat!, event.pool.origin!.long!), () {
        // Do nothing
      }, state.warehouseIcon);
      // Create start point marker for warehouse
      emit(
        state.copyWith(
            startPoint: startPointMarker,
            markers: [startPointMarker, ...state.markers]),
      );

      // Get driver location
      LocationData? currentLocation = await setLocation();
      emit(state.copyWith(
          currentLocation:
              LatLng(currentLocation.latitude!, currentLocation.longitude!)));

      // Add orders to maps
      add(PopulateOrdersLocations(orders: event.pool.orders));

      // Draw poly lines
      add(DrawMarkerPolylines());
    });

    on<ResetMaps>((event, emit) => emit(const MapsState()));

    on<PopulateOrdersLocations>((event, emit) async {
      final markers = event.orders
          .map(
            (e) => buildMarker(
                LatLng(e.destination!.lat!, e.destination!.long!), () {
              // Open order for processing
              add(MarkerTapped(e));
            }, state.destinationIcon),
          )
          .toList();

      // Add start point
      markers.add(state.startPoint!);

      debugPrint("Markers generated: $markers");
      // Update state
      emit(
        state.copyWith(orderMarkers: markers, markers: [
          // state.startPoint!,
          ...state.companyMarkers,
          ...state.warehouseMarkers,
          ...state.orderMarkers
        ]),
      );
      // // Draw polylines for the above
      add(DrawMarkerPolylines());
    });

    // Update picked order
    on<MarkerTapped>((event, emit) {
      emit(state.copyWith(pickedOrder: event.order));
    });

    // draw lines
    on<DrawMarkerPolylines>((event, emit) async {
      final polylines = <Polyline>[];
      // Draw order polylines
      for (var destination in state.orderMarkers) {
        await _addressService
            .polyline(state.startPoint!.position, destination.position)
            .then((value) {
          value.when(onError: (error) {
            emit(state.copyWith(
                message: AppMessage(
                    message: "Route not determined", tone: MessageTone.info)));
          }, onSuccess: (data) {
            polylines.addAll(data);
          });
        });
      }

      // Draw from current location to pick up
      await _addressService
          .polyline(state.currentLocation!, state.startPoint!.position,
              color: Colors.black)
          .then((value) {
        value.when(onError: (error) {
          emit(state.copyWith(
              message: AppMessage(
                  message: "Can't determine route for _ to _",
                  tone: MessageTone.error)));
        }, onSuccess: (data) {
          polylines.addAll(data);
        });
      });

      debugPrint("Polylines created $polylines");

      // Save to state
      emit(state.copyWith(polylines: polylines));
    });
  }
}
