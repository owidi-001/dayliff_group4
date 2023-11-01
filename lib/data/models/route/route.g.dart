// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoutePoolImpl _$$RoutePoolImplFromJson(Map<String, dynamic> json) =>
    _$RoutePoolImpl(
      routeId: json['route_id'] as int,
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
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      cost: (json['route_cost'] as num?)?.toDouble() ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Order>[],
    );

Map<String, dynamic> _$$RoutePoolImplToJson(_$RoutePoolImpl instance) =>
    <String, dynamic>{
      'route_id': instance.routeId,
      'route_name': instance.name,
      'origin_address': instance.origin,
      'destination_address': instance.destination,
      'distance_in_km': instance.distance,
      'estimated_duration_minutes': instance.duration,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'route_cost': instance.cost,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'driver': instance.driver,
      'orders': instance.orders,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.PENDING: 'PENDING',
  OrderStatus.TRANSIT: 'TRANSIT',
  OrderStatus.COMPLETED: 'COMPLETED',
  OrderStatus.CANCELLED: 'CANCELLED',
};

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      name: json['name'] as String?,
      lat: (json['longitude'] as num?)?.toDouble(),
      long: (json['latitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'longitude': instance.lat,
      'latitude': instance.long,
    };

_$DriverImpl _$$DriverImplFromJson(Map<String, dynamic> json) => _$DriverImpl(
      driverId: json['driver_id'] as int?,
      firstName: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone_number'] as String?,
      license: json['license_number'] as String?,
    );

Map<String, dynamic> _$$DriverImplToJson(_$DriverImpl instance) =>
    <String, dynamic>{
      'driver_id': instance.driverId,
      'name': instance.firstName,
      'email': instance.email,
      'phone_number': instance.phone,
      'license_number': instance.license,
    };

_$DriverUpdateImpl _$$DriverUpdateImplFromJson(Map<String, dynamic> json) =>
    _$DriverUpdateImpl(
      firstName: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone_number'] as String?,
      license: json['license_number'] as String?,
    );

Map<String, dynamic> _$$DriverUpdateImplToJson(_$DriverUpdateImpl instance) =>
    <String, dynamic>{
      'name': instance.firstName,
      'email': instance.email,
      'phone_number': instance.phone,
      'license_number': instance.license,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderId: json['order_id'] as int?,
      customerName: json['customer_name'] as String,
      customerPhone: json['customer_phone'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
      destination: json['destination_address'] == null
          ? null
          : Address.fromJson(
              json['destination_address'] as Map<String, dynamic>),
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      route: json['route_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      deliveryConfirmation: json['delivery_confirmation'] == null
          ? null
          : DeliveryConfirmation.fromJson(
              json['delivery_confirmation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'order_date': instance.orderDate.toIso8601String(),
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'destination_address': instance.destination,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'route_id': instance.route,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'delivery_confirmation': instance.deliveryConfirmation,
    };

_$DeliveryConfirmationImpl _$$DeliveryConfirmationImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryConfirmationImpl(
      confirmationId: json['confirmation_id'] as int?,
      orderId: json['order_id'] as int?,
      dateConfirmed: json['confirmation_date'] == null
          ? null
          : DateTime.parse(json['confirmation_date'] as String),
      recipient: json['recipient_name'] as String,
      comments: json['comments'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$DeliveryConfirmationImplToJson(
        _$DeliveryConfirmationImpl instance) =>
    <String, dynamic>{
      'confirmation_id': instance.confirmationId,
      'order_id': instance.orderId,
      'confirmation_date': instance.dateConfirmed?.toIso8601String(),
      'recipient_name': instance.recipient,
      'comments': instance.comments,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
