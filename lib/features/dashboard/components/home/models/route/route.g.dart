// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
      routeId: json['id'] as int,
      name: json['route_name'] as String,
      origin: json['origin_address'] == null
          ? null
          : Address.fromJson(json['origin_address'] as Map<String, dynamic>),
      destination: json['destination_address'] == null
          ? null
          : Address.fromJson(
              json['destination_address'] as Map<String, dynamic>),
      distance: (json['distance_in_km'] as num?)?.toDouble(),
      duration: json['estimated_duration_minutes'] as int?,
    );

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'id': instance.routeId,
      'route_name': instance.name,
      'origin_address': instance.origin,
      'destination_address': instance.destination,
      'distance_in_km': instance.distance,
      'estimated_duration_minutes': instance.duration,
    };

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['id'] as int,
      route: Route.fromJson(json['route'] as Map<String, dynamic>),
      driver: json['driver'] == null
          ? null
          : User.fromJson(json['driver'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      status: $enumDecode(_$TripStatusEnumMap, json['status']),
      date: DateTime.parse(json['date'] as String),
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Order>[],
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'route': instance.route,
      'driver': instance.driver,
      'vehicle': instance.vehicle,
      'status': _$TripStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'orders': instance.orders,
    };

const _$TripStatusEnumMap = {
  TripStatus.ACTIVE: 'ACTIVE',
  TripStatus.INCOMPLETE: 'INCOMPLETE',
  TripStatus.COMPLETE: 'COMPLETE',
};

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderId: json['_id'] as String?,
      destination: json['destination'] == null
          ? null
          : Address.fromJson(json['destination'] as Map<String, dynamic>),
      customer: User.fromJson(json['customer'] as Map<String, dynamic>),
      orderDate: DateTime.parse(json['order_date'] as String),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      '_id': instance.orderId,
      'destination': instance.destination,
      'customer': instance.customer,
      'order_date': instance.orderDate.toIso8601String(),
      'status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ALL: 'ALL',
  OrderStatus.PENDING: 'PENDING',
  OrderStatus.TRANSIT: 'TRANSIT',
  OrderStatus.COMPLETED: 'COMPLETED',
  OrderStatus.CANCELLED: 'CANCELLED',
};

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      name: json['name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'long': instance.long,
    };

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      vehicleId: json['vehicle_id'] as int,
      plateNumber: json['plate_number'] as String?,
      make: json['make'] as String?,
      model: json['model'] as String?,
      type: json['type'] as String?,
      tonnage: json['tonnage'] as String?,
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'plate_number': instance.plateNumber,
      'make': instance.make,
      'model': instance.model,
      'type': instance.type,
      'tonnage': instance.tonnage,
    };
