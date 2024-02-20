part of 'bloc.dart';

class OrderState extends Equatable {
  final List<Trip> trips;
  final AppMessage? message;
  final ServiceStatus status;

  const OrderState({
    this.trips = const [],
    this.message,
    this.status = ServiceStatus.initial,
  });

  OrderState copyWith({
    List<Trip>? trips,
    AppMessage? message,
    ServiceStatus? status,
  }) {
    return OrderState(
      trips: trips ?? this.trips,
      message: message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [message, trips, status];
}
