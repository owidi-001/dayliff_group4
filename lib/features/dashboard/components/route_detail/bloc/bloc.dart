import 'package:dayliff/data/service/maps.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart' as locator;
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'events.dart';
part 'state.dart';

// Bloc
class MapsControllerBloc extends Bloc<MapsEvent, MapsState> {
  late AddressService _addressService;
  late MapsService _mapsService;

  MapsControllerBloc() : super(const MapsState()) {
    _addressService = service<AddressService>();
    _mapsService = service<MapsService>();

    Future<_LocationResult> getLocation({int retries = 0}) async {
      // Determine permission for location
      locator.LocationPermission? permission =
          await locator.Geolocator.requestPermission();

      if (permission == locator.LocationPermission.always ||
          permission == locator.LocationPermission.whileInUse) {
        try {
          final position = await locator.Geolocator.getCurrentPosition(
            desiredAccuracy: locator.LocationAccuracy.high,
          );
          return _LocationResult(
              location: LatLng(position.latitude, position.longitude),
              permission: permission);
        } catch (error) {
          if (retries < 2) {
            return getLocation(retries: retries + 1);
          }
          return _LocationResult(location: null, permission: permission);
        }
      } else {
        if (retries < 2 &&
            (permission == locator.LocationPermission.denied ||
                permission == locator.LocationPermission.deniedForever ||
                permission == locator.LocationPermission.unableToDetermine)) {
          return getLocation(retries: retries + 1);
        } else {
          return _LocationResult(location: null, permission: permission);
        }
      }
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
      _LocationResult? currentLocation = await getLocation();
      // print("The current location: ${currentLocation.location}");

      // Determine status based on currentLocation
      ServiceStatus status = currentLocation.location == null ||
              currentLocation.permission == locator.LocationPermission.denied ||
              currentLocation.permission ==
                  locator.LocationPermission.deniedForever ||
              currentLocation.permission ==
                  locator.LocationPermission.unableToDetermine
          ? ServiceStatus.loadingFailure
          : ServiceStatus.loadingSuccess;
      // print("Service status: $status");
      // print("Location permission status: ${currentLocation.permission}");

      // Update state with values
      emit(
        state.copyWith(
          currentLocation: currentLocation.location,
          status: status,
          permission: currentLocation.permission,
          pickedRoute: event.pool,
        ),
      );

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
              // TODO! Open order for processing
              add(MarkerTapped(e));
            }, state.destinationIcon),
          )
          .toList();

      // Add start point
      markers.add(state.startPoint!);

      print("Markers generated: $markers");
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
      // add(DrawMarkerPolylines());
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
            // showError("Can't determine route for _ to _");
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
          // showError("Can't determine route for _ to _");
        }, onSuccess: (data) {
          polylines.addAll(data);
        });
      });

      print("Polylines created $polylines");

      // Save to state
      emit(state.copyWith(polylines: polylines));
    });
  }
}

// Helper class
class _LocationResult {
  final LatLng? location;
  final locator.LocationPermission? permission;

  _LocationResult({this.location, this.permission});
}
