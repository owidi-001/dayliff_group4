// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TripImpl _$$TripImplFromJson(Map<String, dynamic> json) => _$TripImpl(
      id: json['trip_id'] as int,
      route: Route.fromJson(json['route'] as Map<String, dynamic>),
      name: json['trip_name'] as String?,
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      courier: json['courier'] == null
          ? null
          : Courrier.fromJson(json['courier'] as Map<String, dynamic>),
      origin: json['origin_address'] == null
          ? null
          : Address.fromJson(json['origin_address'] as Map<String, dynamic>),
      destination: json['tdestination_address'] == null
          ? null
          : Address.fromJson(
              json['tdestination_address'] as Map<String, dynamic>),
      distance: json['trip_distance'] as String?,
      duration: json['trip_duration'] as int?,
      status: $enumDecode(_$TripStatusEnumMap, json['trip_status']),
      date: DateTime.parse(json['date'] as String),
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Order>[],
    );

Map<String, dynamic> _$$TripImplToJson(_$TripImpl instance) =>
    <String, dynamic>{
      'trip_id': instance.id,
      'route': instance.route,
      'trip_name': instance.name,
      'driver': instance.driver,
      'vehicle': instance.vehicle,
      'courier': instance.courier,
      'origin_address': instance.origin,
      'tdestination_address': instance.destination,
      'trip_distance': instance.distance,
      'trip_duration': instance.duration,
      'trip_status': _$TripStatusEnumMap[instance.status]!,
      'date': instance.date.toIso8601String(),
      'orders': instance.orders,
    };

const _$TripStatusEnumMap = {
  TripStatus.ACTIVE: 'ACTIVE',
  TripStatus.INCOMPLETE: 'INCOMPLETE',
  TripStatus.COMPLETED: 'COMPLETED',
  TripStatus.CANCELLED: 'CANCELLED',
};

_$DriverImpl _$$DriverImplFromJson(Map<String, dynamic> json) => _$DriverImpl(
      id: json['id'] as int,
      license: json['license_number'] as String,
    );

Map<String, dynamic> _$$DriverImplToJson(_$DriverImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'license_number': instance.license,
    };

_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
      routeId: json['id'] as int,
      name: json['route_name'] as String,
    );

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'id': instance.routeId,
      'route_name': instance.name,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderId: json['id'] as int,
      bcOrderNumber: json['bc_order_number'] as String,
      trip: json['Trip_id'] as int,
      destination: json['destination_address'] == null
          ? null
          : Address.fromJson(
              json['destination_address'] as Map<String, dynamic>),
      customerName: json['customer_name'] as String,
      customerPhone: json['customer_phone'] as String,
      recipientName: json['recipient_name'] as String,
      recipientPhone: json['recipient_phone'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      status: $enumDecode(_$OrderStatusEnumMap, json['order_status']),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.orderId,
      'bc_order_number': instance.bcOrderNumber,
      'Trip_id': instance.trip,
      'destination_address': instance.destination,
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'recipient_name': instance.recipientName,
      'recipient_phone': instance.recipientPhone,
      'order_date': instance.orderDate.toIso8601String(),
      'order_status': _$OrderStatusEnumMap[instance.status]!,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.PENDING: 'PENDING',
  OrderStatus.INCOMPLETE: 'INCOMPLETE',
  OrderStatus.SCHEDULED: 'SCHEDULED',
  OrderStatus.ACTIVE: 'ACTIVE',
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

_$CourrierImpl _$$CourrierImplFromJson(Map<String, dynamic> json) =>
    _$CourrierImpl(
      id: json['id'] as int?,
      name: json['courier_name'] as String?,
      description: json['courier_function'] as String?,
    );

Map<String, dynamic> _$$CourrierImplToJson(_$CourrierImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courier_name': instance.name,
      'courier_function': instance.description,
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

_$OrderConfirmationImpl _$$OrderConfirmationImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderConfirmationImpl(
      orderId: json['order_id'] as int,
      otp: json['otp'] as String?,
      comments: json['handovercomments'] as String?,
      status: json['order_status'] as String?,
      timeCompleted: json['timestartcompleted'] == null
          ? null
          : DateTime.parse(json['timestartcompleted'] as String),
      coordinates: json['dlocation_cordinates'] as String?,
    );

Map<String, dynamic> _$$OrderConfirmationImplToJson(
        _$OrderConfirmationImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'otp': instance.otp,
      'handovercomments': instance.comments,
      'order_status': instance.status,
      'timestartcompleted': instance.timeCompleted?.toIso8601String(),
      'dlocation_cordinates': instance.coordinates,
    };
