// This file is "main.dart"
// ignore_for_file: invalid_annotation_target

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

enum OrderStatus { INCOMPLETE, ACTIVE, COMPLETED, CANCELLED }

extension OrderStatusExtension on OrderStatus {
  String toStringValue() {
    switch (this) {
      case OrderStatus.ACTIVE:
        return 'On Transit';
      case OrderStatus.COMPLETED:
        return 'Completed';
      case OrderStatus.CANCELLED:
        return 'Cancelled';
      case OrderStatus.INCOMPLETE:
        return 'Incomplete';
      default:
        throw Exception('Unknown order status');
    }
  }
}

enum TripStatus { ACTIVE, INCOMPLETE, COMPLETED }

extension TripStatusExtension on TripStatus {
  String toStringValue() {
    switch (this) {
      case TripStatus.ACTIVE:
        return 'Active';
      case TripStatus.INCOMPLETE:
        return 'InComplete';
      case TripStatus.COMPLETED:
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
    @JsonKey(name: "Signature", includeFromJson: false) File? signature,
    // pod
    @Default(<File>[])
    @JsonKey(name: "order_images", includeFromJson: false)
    List<File> orderImages,
    // od
    @JsonKey(name: "od_scan", includeFromJson: false) File? odScan,
    // comments
    @JsonKey(name: "comments") String? comments,
    // status
    @JsonKey(name: "order_status") String? status,
  }) = _OrderConfirmation;

  factory OrderConfirmation.fromJson(Map<String, Object?> json) =>
      _$OrderConfirmationFromJson(json);
}

Trip dummyTrip() {
  return Trip(
    id: 1,
    route: const Route(routeId: 123, name: 'Dummy Route'),
    driver: const Driver(id: 1, license: 'ABC123'),
    vehicle: const Vehicle(
      vehicleId: 1,
      plateNumber: 'XYZ456',
      make: 'Toyota',
      model: 'Camry',
      type: 'Sedan',
      tonnage: '1 ton',
    ),
    courier:
        const Courrier(id: 1, name: 'John Doe', description: 'Delivery person'),
    origin: const Address(name: 'Origin Address', lat: 123.456, long: 789.123),
    destination:
        const Address(name: 'Destination Address', lat: 456.789, long: 321.654),
    distance: '10 km',
    duration: 60,
    status: TripStatus.ACTIVE,
    date: DateTime.now(),
    orders: [
      Order(
        orderId: 1,
        trip: 1,
        destination: const Address(
            name: 'Customer Address', lat: 654.321, long: 987.654),
        customerName: 'John Smith',
        customerPhone: '123-456-7890',
        orderDate: DateTime.now(),
        status: OrderStatus.INCOMPLETE,
      ),
      // Add more orders if needed
    ],
  );
}
