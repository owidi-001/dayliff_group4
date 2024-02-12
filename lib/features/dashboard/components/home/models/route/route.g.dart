// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoutePoolImpl _$$RoutePoolImplFromJson(Map<String, dynamic> json) =>
    _$RoutePoolImpl(
      routeId: json['id'] as int,
      driverId: json['driver_id'] as int,
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
      status: $enumDecode(_$RouteStatusEnumMap, json['status']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      orders: (json['orders'] as List<dynamic>?)
              ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Order>[],
    );

Map<String, dynamic> _$$RoutePoolImplToJson(_$RoutePoolImpl instance) =>
    <String, dynamic>{
      'id': instance.routeId,
      'driver_id': instance.driverId,
      'route_name': instance.name,
      'origin_address': instance.origin,
      'destination_address': instance.destination,
      'distance_in_km': instance.distance,
      'estimated_duration_minutes': instance.duration,
      'status': _$RouteStatusEnumMap[instance.status]!,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'orders': instance.orders,
    };

const _$RouteStatusEnumMap = {
  RouteStatus.ACTIVE: 'ACTIVE',
  RouteStatus.INCOMPLETE: 'INCOMPLETE',
  RouteStatus.COMPLETE: 'COMPLETE',
};

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      name: json['address_name'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'address_name': instance.name,
      'lat': instance.lat,
      'long': instance.long,
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
      orderId: json['_id'] as String?,
      destination: json['destination_address'] == null
          ? null
          : Address.fromJson(
              json['destination_address'] as Map<String, dynamic>),
      customerName: json['customer_name'] as String,
      customerPhone: json['customer_phone'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
      deliveryDate: json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
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
      '_id': instance.orderId,
      'destination_address': instance.destination,
      'customer_name': instance.customerName,
      'customer_phone': instance.customerPhone,
      'order_date': instance.orderDate.toIso8601String(),
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'status': _$OrderStatusEnumMap[instance.status]!,
      'route_id': instance.route,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'delivery_confirmation': instance.deliveryConfirmation,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.ALL: 'ALL',
  OrderStatus.PENDING: 'PENDING',
  OrderStatus.TRANSIT: 'TRANSIT',
  OrderStatus.PARTIAL: 'PARTIAL',
  OrderStatus.COMPLETED: 'COMPLETED',
  OrderStatus.CANCELLED: 'CANCELLED',
};

_$DeliveryConfirmationImpl _$$DeliveryConfirmationImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryConfirmationImpl(
      confirmationId: json['_id'] as int?,
      dateConfirmed: json['confirmation_date'] == null
          ? null
          : DateTime.parse(json['confirmation_date'] as String),
      orderId: json['order_id'] as String,
      recipient: json['recipient_name'] as String,
      comments: json['comments'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$DeliveryConfirmationImplToJson(
        _$DeliveryConfirmationImpl instance) =>
    <String, dynamic>{
      '_id': instance.confirmationId,
      'confirmation_date': instance.dateConfirmed?.toIso8601String(),
      'order_id': instance.orderId,
      'recipient_name': instance.recipient,
      'comments': instance.comments,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
