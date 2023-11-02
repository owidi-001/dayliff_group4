// This file is "main.dart"
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

enum OrderStatus { PENDING, TRANSIT, PARTIAL, COMPLETED, CANCELLED }

extension OrderStatusExtension on OrderStatus {
  String toStringValue() {
    switch (this) {
      case OrderStatus.PENDING:
        return 'Pending';
      case OrderStatus.TRANSIT:
        return 'On Transit';
      case OrderStatus.PARTIAL:
        return 'Partially Completed';
      case OrderStatus.COMPLETED:
        return 'Completed';
      case OrderStatus.CANCELLED:
        return 'Cancelled';
      default:
        throw Exception('Unknown order status');
    }
  }
}

@freezed
class RoutePool with _$RoutePool {
  const factory RoutePool(
      {@JsonKey(name: "route_id") required int routeId,
      @JsonKey(name: "route_name") required String name,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "distance_in_km") double? distance,
      @JsonKey(name: "estimated_duration_minutes") int? duration,
      required OrderStatus status,
      @Default(0) @JsonKey(name: "route_cost") double cost,
      @JsonKey(name: "created_at") required DateTime createdAt,
      @JsonKey(name: "updated_at") required DateTime updatedAt,
      // Driver? driver,
      @Default(<Order>[]) List<Order> orders}) = _RoutePool;

  factory RoutePool.fromJson(Map<String, Object?> json) =>
      _$RoutePoolFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: "address_name") String? name,
    @JsonKey(name: "lat") double? lat,
    @JsonKey(name: "long") double? long,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}

// @freezed
// class Driver with _$Driver {
//   const factory Driver({
//     @JsonKey(name: "name") String? firstName,
//     @JsonKey(name: "_id") int? driverId,
//     @JsonKey(name: "email") String? email,
//     @JsonKey(name: "phone_number") String? phone,
//     @JsonKey(name: "license_number") String? license,
//   }) = _Driver;

//   factory Driver.fromJson(Map<String, Object?> json) => _$DriverFromJson(json);
// }

@freezed
class DriverUpdate with _$DriverUpdate {
  const factory DriverUpdate({
    @JsonKey(name: "name") String? firstName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phone,
    @JsonKey(name: "license_number") String? license,
  }) = _DriverUpdate;

  factory DriverUpdate.fromJson(Map<String, Object?> json) =>
      _$DriverUpdateFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order(
      {@JsonKey(name: "_id") String? orderId,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "customer_name") required String customerName,
      @JsonKey(name: "customer_phone") required String customerPhone,
      @JsonKey(name: "order_date") required DateTime orderDate,
      @JsonKey(name: "delivery_date") DateTime? deliveryDate,
      required OrderStatus status,
      @JsonKey(name: "route_id") required int route,
      @JsonKey(name: "created_at") required DateTime createdAt,
      @JsonKey(name: "updated_at") required DateTime updatedAt,
      @JsonKey(name: "delivery_confirmation")
      DeliveryConfirmation? deliveryConfirmation,
      @JsonKey(name: "Signature", includeFromJson: false) File? signature,
      @JsonKey(name: "order_image", includeFromJson: false)
      File? orderImage}) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}

@freezed
class DeliveryConfirmation with _$DeliveryConfirmation {
  const factory DeliveryConfirmation(
      {@JsonKey(name: "_id") int? confirmationId,
      @JsonKey(name: "confirmation_date") DateTime? dateConfirmed,
      @JsonKey(name: "order_id") required String orderId,
      @JsonKey(name: "recipient_name") required String recipient,
      @JsonKey(name: "order_image", includeFromJson: false) File? orderImage,
      @JsonKey(name: "comments") String? comments,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at")
      DateTime? updatedAt}) = _DeliveryConfirmation;

  factory DeliveryConfirmation.fromJson(Map<String, Object?> json) =>
      _$DeliveryConfirmationFromJson(json);
}
