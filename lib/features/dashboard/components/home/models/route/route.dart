// This file is "main.dart"
// ignore_for_file: invalid_annotation_target

import 'dart:io';
import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

enum OrderStatus { Incomplete, Active, Completed, Cancelled }

extension OrderStatusExtension on OrderStatus {
  String toStringValue() {
    switch (this) {
      case OrderStatus.Active:
        return 'On Transit';
      case OrderStatus.Completed:
        return 'Completed';
      case OrderStatus.Cancelled:
        return 'Cancelled';
      case OrderStatus.Incomplete:
        return 'Incomplete';
      default:
        throw Exception('Unknown order status');
    }
  }
}

enum TripStatus { Active, Incomplete, Complete }

extension TripStatusExtension on TripStatus {
  String toStringValue() {
    switch (this) {
      case TripStatus.Active:
        return 'Active';
      case TripStatus.Incomplete:
        return 'In Complete';
      case TripStatus.Complete:
        return 'Completed';
      default:
        throw Exception('Unknown route status');
    }
  }
}

@freezed
class Trip with _$Trip {
  const factory Trip(
      {@JsonKey(name: "trip_id") required int id,
      @JsonKey(name: "route") required Route route,
      @JsonKey(name: "driver") Driver? driver,
      @JsonKey(name: "vehicle") Vehicle? vehicle,
      @JsonKey(name: "courier") Courrier? courier,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "tdestination_address") Address? destination,
      @JsonKey(name: "trip_distance") String? distance,
      @JsonKey(name: "trip_duration") int? duration,
      @JsonKey(name: "trip_status") required TripStatus status,
      required DateTime date,
      @Default(<Order>[]) List<Order> orders}) = _Trip;

  factory Trip.fromJson(Map<String, Object?> json) => _$TripFromJson(json);
}

@freezed
class Driver with _$Driver {
  const factory Driver(
      {@JsonKey(name: "id") required int id,
      @JsonKey(name: "license_number") required String license}) = _Driver;

  factory Driver.fromJson(Map<String, Object?> json) => _$DriverFromJson(json);
}

@freezed
class Route with _$Route {
  const factory Route({
    @JsonKey(name: "id") required int routeId,
    @JsonKey(name: "route_name") required String name,
  }) = _Route;

  factory Route.fromJson(Map<String, Object?> json) => _$RouteFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    @JsonKey(name: "id") int? orderId,
    @JsonKey(name: "trip_id") int? trip,
    @JsonKey(name: "destination_address") Address? destination,
    @JsonKey(name: "customer_name") required String customerName,
    @JsonKey(name: "customer_phone") required String customerPhone,
    @JsonKey(name: "order_date") required DateTime orderDate,
    @JsonKey(name: "order_status") required OrderStatus status,
  }) = _Order;

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
class Courrier with _$Courrier {
  const factory Courrier({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "courier_name") String? name,
    @JsonKey(name: "courier_function") String? description,
  }) = _Courrier;

  factory Courrier.fromJson(Map<String, Object?> json) =>
      _$CourrierFromJson(json);
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

@freezed
class OrderConfirmation with _$OrderConfirmation {
  const factory OrderConfirmation({
    @JsonKey(name: "order_id") required int orderId,
    // validation
    @JsonKey(name: "otp") String? otp,
    @JsonKey(name: "receiver_id", includeFromJson: false) File? receiverId,
    // signature
    @JsonKey(name: "Signature", includeFromJson: false) Image? signature,
    // pod
    @Default(<File>[])
    @JsonKey(name: "order_images", includeFromJson: false)
    List<File> orderImages,
    // od
    @JsonKey(name: "od_scan", includeFromJson: false) File? odScan,
    // comments
    @JsonKey(name: "comments") String? comments,
  }) = _OrderConfirmation;

  factory OrderConfirmation.fromJson(Map<String, Object?> json) =>
      _$OrderConfirmationFromJson(json);
}
