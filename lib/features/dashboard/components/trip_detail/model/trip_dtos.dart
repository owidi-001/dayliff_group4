// ignore_for_file: invalid_annotation_target

import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'trip_dtos.freezed.dart';
part 'trip_dtos.g.dart';

// Start trip payload
@freezed
class StartTripRequest with _$StartTripRequest {
  const factory StartTripRequest(
          {@JsonKey(name: "trip_id") required int tripId,
          @JsonKey(name: "start_trip") required LatLng_ coordinates,
          required TripStatus status,
          @JsonKey(name: "start_trip_time") required DateTime startTime}) =
      _StartTripRequest;

  factory StartTripRequest.fromJson(Map<String, Object?> json) =>
      _$StartTripRequestFromJson(json);
}

@freezed
class LatLng_ with _$LatLng_ {
  const factory LatLng_({
    @JsonKey(name: "lat") double? latitude,
    @JsonKey(name: "long") double? longitude,
  }) = _LatLng_;

  factory LatLng_.fromJson(Map<String, Object?> json) =>
      _$LatLng_FromJson(json);
}

@freezed
class StartTripResponse with _$StartTripResponse {
  const factory StartTripResponse({
    @JsonKey(name: "message") required String message,
  }) = _StartTripResponse;

  factory StartTripResponse.fromJson(Map<String, Object?> json) =>
      _$StartTripResponseFromJson(json);
}

// Start navigation payload
@freezed
class StartNavigationRequest with _$StartNavigationRequest {
  factory StartNavigationRequest(
      {@JsonKey(name: "order_id") required int orderId,
      @JsonKey(name: "origin_address") required LatLng_ coordinates,
      @JsonKey(name: "order_status") required OrderStatus status,
      required DateTime timestartnavigation}) = _StartNavigationRequest;

  factory StartNavigationRequest.fromJson(Map<String, Object?> json) =>
      _$StartNavigationRequestFromJson(json);
}

@freezed
class StartHandoverRequest with _$StartHandoverRequest {
  factory StartHandoverRequest(
          {@JsonKey(name: "order_id") required int orderId,
          required LatLng_ coordinates,
          required OrderStatus status,
          @JsonKey(name: "timestarthandover") required DateTime? time}) =
      _StartHandoverRequest;

  factory StartHandoverRequest.fromJson(Map<String, dynamic> json) =>
      _$StartHandoverRequestFromJson(json);
}


// @freezed
// class StartHandoverResponse with _$StartHandoverResponse {
//   const factory StartHandoverResponse({required String message}) =
//       _StartHandoverResponse;

//   factory StartHandoverResponse.fromJson(Map<String, Object?> json) =>
//       _$StartHandoverResponseFromJson(json);
// }
