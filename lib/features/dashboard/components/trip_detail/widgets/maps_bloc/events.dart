part of 'bloc.dart';

// Events
abstract class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object?> get props => [];
}

class StartMapsEvent extends MapsEvent {
  final Trip pool;

  const StartMapsEvent({required this.pool});

  @override
  List<Object?> get props => [pool];
}

class PopulateCompanyLocations extends MapsEvent {}
class PopulateWarehouseLocations extends MapsEvent {}

class PopulateOrdersLocations extends MapsEvent {
  final List<Order> orders;

  const PopulateOrdersLocations({required this.orders});
  List<Object?> get props => [orders];
}

class DrawMarkerPolylines extends MapsEvent {}

class ResetMaps extends MapsEvent {}

// Marker tapped
class MarkerTapped extends MapsEvent {
  final Order order;
  const MarkerTapped(this.order);
  @override
  List<Object?> get props => [order];
}