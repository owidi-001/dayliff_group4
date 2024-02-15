// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartTripRequestImpl _$$StartTripRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StartTripRequestImpl(
      tripId: json['trip_id'] as int,
      coordinates:
          LatLng_.fromJson(json['coordinates'] as Map<String, dynamic>),
      status: $enumDecode(_$TripStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$StartTripRequestImplToJson(
        _$StartTripRequestImpl instance) =>
    <String, dynamic>{
      'trip_id': instance.tripId,
      'coordinates': instance.coordinates,
      'status': _$TripStatusEnumMap[instance.status]!,
    };

const _$TripStatusEnumMap = {
  TripStatus.Active: 'Active',
  TripStatus.Incomplete: 'Incomplete',
  TripStatus.Complete: 'Complete',
};

_$LatLng_Impl _$$LatLng_ImplFromJson(Map<String, dynamic> json) =>
    _$LatLng_Impl(
      latitude: (json['lat'] as num).toDouble(),
      longitude: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$$LatLng_ImplToJson(_$LatLng_Impl instance) =>
    <String, dynamic>{
      'lat': instance.latitude,
      'long': instance.longitude,
    };

_$StartTripResponseImpl _$$StartTripResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StartTripResponseImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$StartTripResponseImplToJson(
        _$StartTripResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$StartNavigationRequestImpl _$$StartNavigationRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StartNavigationRequestImpl(
      orderId: json[''] as int,
      coordinates:
          LatLng_.fromJson(json['coordinates'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$StartNavigationRequestImplToJson(
        _$StartNavigationRequestImpl instance) =>
    <String, dynamic>{
      '': instance.orderId,
      'coordinates': instance.coordinates,
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.Incomplete: 'Incomplete',
  OrderStatus.Active: 'Active',
  OrderStatus.Completed: 'Completed',
  OrderStatus.Cancelled: 'Cancelled',
};

_$StartNavigationResponseImpl _$$StartNavigationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StartNavigationResponseImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$StartNavigationResponseImplToJson(
        _$StartNavigationResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

_$StartHandoverRequestImpl _$$StartHandoverRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StartHandoverRequestImpl(
      orderId: json[''] as int,
      coordinates:
          LatLng_.fromJson(json['coordinates'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$StartHandoverRequestImplToJson(
        _$StartHandoverRequestImpl instance) =>
    <String, dynamic>{
      '': instance.orderId,
      'coordinates': instance.coordinates,
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

_$StartHandoverResponseImpl _$$StartHandoverResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StartHandoverResponseImpl(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$StartHandoverResponseImplToJson(
        _$StartHandoverResponseImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
