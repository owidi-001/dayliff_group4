// This file is "main.dart"
// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:dayliff/data/models/auth/login.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

enum OrderStatus { ALL, PENDING, TRANSIT, COMPLETED, CANCELLED }

extension OrderStatusExtension on OrderStatus {
  String toStringValue() {
    switch (this) {
      case OrderStatus.PENDING:
        return 'Pending';
      case OrderStatus.TRANSIT:
        return 'On Transit';
      case OrderStatus.COMPLETED:
        return 'Completed';
      case OrderStatus.CANCELLED:
        return 'Cancelled';
      case OrderStatus.ALL:
        return 'All';
      default:
        throw Exception('Unknown order status');
    }
  }
}

enum TripStatus { ACTIVE, INCOMPLETE, COMPLETE }

extension TripStatusExtension on TripStatus {
  String toStringValue() {
    switch (this) {
      case TripStatus.ACTIVE:
        return 'Active';
      case TripStatus.INCOMPLETE:
        return 'In Complete';
      case TripStatus.COMPLETE:
        return 'Completed';
      default:
        throw Exception('Unknown route status');
    }
  }
}

@freezed
class Route with _$Route {
  const factory Route({
    @JsonKey(name: "id") required int routeId,
    @JsonKey(name: "route_name") required String name,
    @JsonKey(name: "origin_address") Address? origin,
    @JsonKey(name: "destination_address") Address? destination,
    @JsonKey(name: "distance_in_km") double? distance,
    @JsonKey(name: "estimated_duration_minutes") int? duration,
  }) = _Route;

  factory Route.fromJson(Map<String, Object?> json) => _$RouteFromJson(json);
}

@freezed
class Trip with _$Trip {
  const factory Trip(
      {@JsonKey(name: "id") required int id,
      @JsonKey(name: "route") required Route route,
      @JsonKey(name: "driver") User? driver,
      @JsonKey(name: "vehicle") Vehicle? vehicle,
      required TripStatus status,
      required DateTime date,
      @Default(<Order>[]) List<Order> orders}) = _Trip;

  factory Trip.fromJson(Map<String, Object?> json) => _$TripFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order(
      {@JsonKey(name: "_id") String? orderId,
      @JsonKey(name: "destination") Address? destination,
      @JsonKey(name: "customer") required User customer,
      @JsonKey(name: "order_date") required DateTime orderDate,
      required OrderStatus status,
      @JsonKey(name: "order_image", includeFromJson: false)
      File? orderImage}) = _Order;

  factory Order.fromJson(Map<String, Object?> json) => _$OrderFromJson(json);
}

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "lat") double? lat,
    @JsonKey(name: "long") double? long,
  }) = _Address;

  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);
}

@freezed
class Vehicle with _$Vehicle {
  const factory Vehicle(
      {@JsonKey(name: "vehicle_id") required int vehicleId,
      @JsonKey(name: "plate_number") String? plateNumber,
      @JsonKey(name: "make") String? make,
      @JsonKey(name: "model") String? model,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "tonnage") String? tonnage}) = _Vehicle;

  factory Vehicle.fromJson(Map<String, Object?> json) =>
      _$VehicleFromJson(json);
}

// @freezed
// class DeliveryConfirmation with _$DeliveryConfirmation {
//   const factory DeliveryConfirmation(
//       {@JsonKey(name: "order_id") required int orderId,
//       @JsonKey(name: "otp") String? otp,
//       @JsonKey(name: "receiver_id", includeFromJson: false) File? receiverId,
//       @JsonKey(name: "Signature", includeFromJson: false) File? signature,
//       @Default(<File>[])
//       @JsonKey(name: "order_images", includeFromJson: false)
//       List<File> orderImage,
//       @JsonKey(name: "comments") String? comments,
//       @JsonKey(name: "updated_at")
//       DateTime? updatedAt}) = _DeliveryConfirmation;

//   factory DeliveryConfirmation.fromJson(Map<String, Object?> json) =>
//       _$DeliveryConfirmationFromJson(json);
// }
