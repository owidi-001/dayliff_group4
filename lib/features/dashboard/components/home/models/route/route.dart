// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

enum OrderStatus {
  PENDING,
  INCOMPLETE,
  SCHEDULED,
  ACTIVE,
  COMPLETED,
  CANCELLED
}

extension OrderStatusExtension on OrderStatus {
  String toStringValue() {
    switch (this) {
      case OrderStatus.ACTIVE:
        return 'Active';
      case OrderStatus.COMPLETED:
        return 'Completed';
      case OrderStatus.CANCELLED:
        return 'Cancelled';
      case OrderStatus.SCHEDULED:
        return 'Scheduled';
      case OrderStatus.INCOMPLETE || OrderStatus.PENDING:
        return 'Incomplete';
      default:
        throw Exception('Unknown order status');
    }
  }
}

enum TripStatus { ACTIVE, INCOMPLETE, COMPLETED, CANCELLED }

extension TripStatusExtension on TripStatus {
  String toStringValue() {
    switch (this) {
      case TripStatus.ACTIVE:
        return 'Active';
      case TripStatus.INCOMPLETE:
        return 'Incomplete';
      case TripStatus.COMPLETED:
        return 'Completed';
      case TripStatus.CANCELLED:
        return 'Cancelled';
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
      @JsonKey(name: "trip_name") required String? name,
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
    @JsonKey(name: "id") required int orderId,
    @JsonKey(name: "bc_order_number") required String bcOrderNumber,
    @JsonKey(name: "Trip_id") required int trip,
    @JsonKey(name: "destination_address") Address? destination,
    @JsonKey(name: "customer_name") required String customerName,
    @JsonKey(name: "customer_phone") required String customerPhone,
    @JsonKey(name: "recipient_name") required String recipientName,
    @JsonKey(name: "recipient_phone") required String recipientPhone,
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
    @JsonKey(name: "id_number") String? idNumber,
    @JsonKey(name: "receiver_id", includeFromJson: false) File? receiverId,
    // signature
    @JsonKey(name: "recipientsignature", includeFromJson: false)
    File? signature,
    // pod
    @Default(<File>[])
    @JsonKey(name: "dodphoto", includeFromJson: false)
    List<File> orderImages,
    // od
    @Default(<File>[])
    @JsonKey(name: "dodscan", includeFromJson: false)
    List<File> dnote,
    // comments
    @JsonKey(name: "handovercomments") String? comments,
    // status
    @JsonKey(name: "order_status") String? status,
    // time completed
    @JsonKey(name: "timestartcompleted") DateTime? timeCompleted,
    // Completed destination
    @JsonKey(name: "dlocation_cordinates") String? coordinates,
  }) = _OrderConfirmation;

  factory OrderConfirmation.fromJson(Map<String, Object?> json) =>
      _$OrderConfirmationFromJson(json);
}
