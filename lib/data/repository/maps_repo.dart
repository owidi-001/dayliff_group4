import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/error/error_handler.dart';
import 'package:dayliff/data/models/multiple_results/multiple_results.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressService {
  AddressService();
  Dio client = Dio();

  final polylinePoints = PolylinePoints();

  final String sessionToken = AppUtility.randomString(10);

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
