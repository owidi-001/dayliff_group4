part of 'bloc.dart';

// Events
abstract class MapsEvent extends Equatable {
  const MapsEvent();

  @override
  List<Object?> get props => [];
}

class StartMapsEvent extends MapsEvent {
  final RoutePool pool;

  const StartMapsEvent({required this.pool});

  @override
  List<Object?> get props => [pool];
}

class PopulateCompanyLocations extends MapsEvent {}

class PopulateOrdersLocations extends MapsEvent {
  final List<Order> orders;

  const PopulateOrdersLocations({required this.orders});
  List<Object?> get props => [orders];
}

class PopulateWarehouseLocations extends MapsEvent {}

class DrawMarkerPolylines extends MapsEvent {}

class ResetMaps extends MapsEvent {}

// class ToggleMapView extends MapsEvent {
//   final List<Order> orders;
//   const ToggleMapView(this.orders);
//   List<Object?> get props => [orders];
// }

// Marker tapped
class MarkerTapped extends MapsEvent {
  final Order order;
  const MarkerTapped(this.order);
  @override
  List<Object?> get props => [order];
}
