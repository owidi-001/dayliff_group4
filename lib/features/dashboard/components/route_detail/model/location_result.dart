import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationResult {
  final LatLng? location;
  final LocationPermission? permission;

  LocationResult({this.location, this.permission});
}
