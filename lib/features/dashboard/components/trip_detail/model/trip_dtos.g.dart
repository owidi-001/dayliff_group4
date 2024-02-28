// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartTripRequestImpl _$$StartTripRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StartTripRequestImpl(
      tripId: json['trip_id'] as int,
      coordinates: LatLng_.fromJson(json['start_trip'] as Map<String, dynamic>),
      status: $enumDecode(_$TripStatusEnumMap, json['status']),
      startTime: DateTime.parse(json['start_trip_time'] as String),
    );

Map<String, dynamic> _$$StartTripRequestImplToJson(
        _$StartTripRequestImpl instance) =>
    <String, dynamic>{
      'trip_id': instance.tripId,
      'start_trip': instance.coordinates,
      'status': _$TripStatusEnumMap[instance.status]!,
      'start_trip_time': instance.startTime.toIso8601String(),
    };

const _$TripStatusEnumMap = {
  TripStatus.ACTIVE: 'ACTIVE',
  TripStatus.INCOMPLETE: 'INCOMPLETE',
  TripStatus.COMPLETED: 'COMPLETED',
  TripStatus.CANCELLED: 'CANCELLED',
};

_$LatLng_Impl _$$LatLng_ImplFromJson(Map<String, dynamic> json) =>
    _$LatLng_Impl(
      latitude: (json['lat'] as num?)?.toDouble(),
      longitude: (json['long'] as num?)?.toDouble(),
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
      orderId: json['order_id'] as int,
      coordinates:
          LatLng_.fromJson(json['origin_address'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['order_status']),
      timestartnavigation:
          DateTime.parse(json['timestartnavigation'] as String),
    );

Map<String, dynamic> _$$StartNavigationRequestImplToJson(
        _$StartNavigationRequestImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'origin_address': instance.coordinates,
      'order_status': _$OrderStatusEnumMap[instance.status]!,
      'timestartnavigation': instance.timestartnavigation.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.INCOMPLETE: 'INCOMPLETE',
  OrderStatus.SCHEDULED: 'SCHEDULED',
  OrderStatus.ACTIVE: 'ACTIVE',
  OrderStatus.COMPLETED: 'COMPLETED',
  OrderStatus.CANCELLED: 'CANCELLED',
};

_$StartHandoverRequestImpl _$$StartHandoverRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StartHandoverRequestImpl(
      orderId: json['order_id'] as int,
      coordinates:
          LatLng_.fromJson(json['coordinates'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      time: json['timestarthandover'] == null
          ? null
          : DateTime.parse(json['timestarthandover'] as String),
    );

Map<String, dynamic> _$$StartHandoverRequestImplToJson(
        _$StartHandoverRequestImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'coordinates': instance.coordinates,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'timestarthandover': instance.time?.toIso8601String(),
    };
