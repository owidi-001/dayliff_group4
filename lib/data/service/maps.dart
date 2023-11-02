import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/error/error_handler.dart';
import 'package:dayliff/data/models/multiple_results/multiple_results.dart';
import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import "package:geolocator_platform_interface/src/enums/location_service.dart"
    as status;

class AddressService {
  AddressService();
  Dio client = Dio();

  final polylinePoints = PolylinePoints();
  Position? _position;

  final String sessionToken = AppUtility.randomString(10);
  Future<bool> openAppSettings() => Geolocator.openAppSettings();
  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();
  Future<LocationPermission> checkPermission() => Geolocator.checkPermission();
  Future<LocationPermission> requestPermission() =>
      Geolocator.requestPermission();

  Future<Position> currentPosition() async {
    if (requestPermission() != LocationPermission.always ||
        requestPermission() != LocationPermission.whileInUse) {
      requestPermission();
    }

    if (_position != null) return _position!;
    _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return _position!;
  }

  Future<Position?> getLastKnownPosition() => Geolocator.getLastKnownPosition();
  Future<bool> serviceEnabled() => Geolocator.isLocationServiceEnabled();

  final Stream<Position> positionStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ),
  );
  final Stream<status.ServiceStatus> serviceStatus =
      Geolocator.getServiceStatusStream();

  HttpResult<Address> getPlaceDetailFromId(String placeId) async {
    try {
      final url = 'https://maps.googleapis.com/maps/api/place/details/json?'
          'place_id=$placeId&fields=address_components,name,geometry'
          '&key=${dotenv.env["MAPS_KEY"]}&sessiontoken=$sessionToken';
      final response = await client.get(url);

      final result = response.data;

      return MultipleResult.onSuccess(data: formattedAddress(result["result"]));
    } on DioException catch (e) {
      return MultipleResult.onError(error: ErrorHandler(e).handle());
    } catch (e) {
      return MultipleResult.onError(error: Failure(error: e.toString()));
    }
  }

  HttpResult<Address> reverseGeocoding(
      {required double lat, required double lng}) async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng'
          '&fields=address_components,name,geometry'
          '&key=${dotenv.env["MAPS_KEY"]}';

      final response = await client.get(url);
      if (kDebugMode) {
        print(response);
      }
      if (response.data["results"].length > 0) {
        return MultipleResult.onSuccess(
            data: formattedAddress(response.data["results"][0]).copyWith(
          lat: lat,
          long: lng,
        ));
      }
    } on DioException catch (e) {
      return MultipleResult.onError(error: ErrorHandler(e).handle());
    } catch (e) {
      return MultipleResult.onError(error: Failure(error: e.toString()));
    }

    return MultipleResult.onSuccess(data: Address(lat: lat, long: lng));
  }

  Address formattedAddress(result) {
    final components = result['address_components'] as List<dynamic>;
    String? street;
    String? premise;
    String floor = "";
    String room = "";
    String streetNumber = "";
    String country = "";
    String? locality;
    String subLocality = "";
    String route = "";
    String? adminArea1;
    String? adminArea2;
    String? adminArea3;

    // build result
    //construct place from google map api result
    for (var c in components) {
      final List type = c['types'];
      if (type.contains('premise')) {
        premise = c['long_name'];
      }
      if (type.contains('floor')) {
        floor = c['long_name'];
      }
      if (type.contains('room')) {
        room = c['long_name'];
      }
      if (type.contains('street_address')) {
        street = c['long_name'];
      }
      if (type.contains('street_number')) {
        streetNumber = c['long_name'];
      }
      if (type.contains('route')) {
        route = c['long_name'];
      }
      if (type.contains('locality')) {
        locality = c['long_name'];
      }
      if (type.contains('sublocality')) {
        subLocality = c['long_name'];
      }
      if (type.contains("administrative_area_level_1")) {
        adminArea1 = c["long_name"];
      }
      if (type.contains("administrative_area_level_2")) {
        adminArea2 = c["long_name"];
      }
      if (type.contains("administrative_area_level_3")) {
        adminArea3 = c["long_name"];
      }
      if (type.contains('country')) {
        country = c['long_name'];
      }
    }
    //set place name
    String? name = result['name'];
    //longitude latitude
    print(result['geometry']);
    double lat = result['geometry']["location"]["lat"];
    double lng = result['geometry']["location"]["lng"];
    List<String> addressData = [
      floor,
      room,
      streetNumber,
      route,
      street ?? premise ?? "",
      subLocality,
      locality ?? adminArea1 ?? "",
      adminArea2 ?? "",
      adminArea3 ?? "",
      country,
    ].where((value) => value.isNotEmpty).toList();
    addressData =
        addressData.isEmpty ? [result['formatted_address'] ?? ""] : addressData;
    return Address(
      name: name ?? addressData.join(", "),
      lat: lat,
      long: lng,
    );
  }

  HttpResult<List<Polyline>> polyline(LatLng origin, LatLng destination,
      {Color? color}) async {
    try {
      List<LatLng> polylineCoordinates = [];
      List<Polyline> polylines = [];

      final res = polylinePoints.getRouteBetweenCoordinates(
        dotenv.env["MAPS_KEY"]!,
        PointLatLng(origin.latitude, origin.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving,
      );
      await res.then(
        (result) {
          if (result.points.isNotEmpty) {
            polylineCoordinates.clear();
            for (int i = 0; i < result.points.length; i++) {
              PointLatLng point = result.points[i];
              polylineCoordinates.add(LatLng(point.latitude, point.longitude));
            }
          }
          PolylineId id = PolylineId(AppUtility.randomString(10));
          Polyline polyline = Polyline(
            polylineId: id,
            color: color ?? Colors.blue,
            points: polylineCoordinates,
            width: 5,
          );
          polylines.add(polyline);
        },
      );
      return MultipleResult.onSuccess(data: polylines);
    } on DioException catch (e) {
      return MultipleResult.onError(error: ErrorHandler(e).handle());
    } catch (e) {
      return MultipleResult.onError(error: Failure(error: e.toString()));
    }
  }
}
