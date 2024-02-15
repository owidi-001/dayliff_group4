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
      required LatLng_ coordinates,
      required TripStatus status}) = _StartTripRequest;

  factory StartTripRequest.fromJson(Map<String, Object?> json) =>
      _$StartTripRequestFromJson(json);
}

@freezed
class LatLng_ with _$LatLng_ {
  const factory LatLng_({
    @JsonKey(name: "lat") required double latitude,
    @JsonKey(name: "long") required double longitude,
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
  const factory StartNavigationRequest(
      {@JsonKey(name: "") required int orderId,
      required LatLng_ coordinates,
      required OrderStatus status}) = _StartNavigationRequest;

  factory StartNavigationRequest.fromJson(Map<String, Object?> json) =>
      _$StartNavigationRequestFromJson(json);
}

@freezed
class StartNavigationResponse with _$StartNavigationResponse {
  const factory StartNavigationResponse({required String message}) =
      _StartNavigationResponse;

  factory StartNavigationResponse.fromJson(Map<String, Object?> json) =>
      _$StartNavigationResponseFromJson(json);
}

// Start handover
@freezed
class StartHandoverRequest with _$StartHandoverRequest {
  const factory StartHandoverRequest(
      {@JsonKey(name: "") required int orderId,
      required LatLng_ coordinates,
      required OrderStatus status}) = _StartHandoverRequest;

  factory StartHandoverRequest.fromJson(Map<String, Object?> json) =>
      _$StartHandoverRequestFromJson(json);
}

@freezed
class StartHandoverResponse with _$StartHandoverResponse {
  const factory StartHandoverResponse({required String message}) =
      _StartHandoverResponse;

  factory StartHandoverResponse.fromJson(Map<String, Object?> json) =>
      _$StartHandoverResponseFromJson(json);
}