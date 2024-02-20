import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationStreamer {
  LocationStreamer._();
  static LocationStreamer instance = LocationStreamer._();
  final _controller = StreamController<LatLng?>.broadcast();

  LatLng? _currentLocation;

  final Location _location = Location();

  Stream<LatLng?> get stream {
    initialize(); // Initialize location stream when getter is accessed
    return _controller.stream.asBroadcastStream();
  }

  Future<void> initialize() async {
    _location.onLocationChanged.listen((LocationData locationData) {
      _currentLocation =
          LatLng(locationData.latitude!, locationData.longitude!);
      _controller.add(_currentLocation); // Add new location to the stream
    });

    final locationData = await _location.getLocation();
    _currentLocation = LatLng(locationData.latitude!, locationData.longitude!);
    _controller.add(_currentLocation); // Add initial location to the stream
  }

  LatLng? get currentLocation => _currentLocation;
}
