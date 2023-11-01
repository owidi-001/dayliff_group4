part of 'bloc.dart';

class OrderState extends Equatable {
  final List<RoutePool> pools;
  final String? message;
  final ServiceStatus status;

  const OrderState({
    this.pools = const [],
    this.message,
    this.status = ServiceStatus.initial,
  });

  OrderState copyWith({
    List<RoutePool>? pools,
    String? message,
    ServiceStatus? status,
  }) {
    return OrderState(
      pools: pools ?? this.pools,
      message: message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        message,
        pools,
        status,
      ];
}
