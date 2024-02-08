part of 'bloc.dart';

class OrderState extends Equatable {
  final List<RoutePool> pools;

  final List<RoutePool> filteredPools;
  final String? message;
  final ServiceStatus status;
  final List<File> orderImages;
  final Order? orderOnConfirmation;
  final OrderStatus filter;

  const OrderState(
      {this.pools = const [],
      this.message,
      this.filteredPools = const [],
      this.status = ServiceStatus.initial,
      this.orderImages = const [],
      this.orderOnConfirmation,
      this.filter = OrderStatus.ALL});

  OrderState copyWith(
      {List<RoutePool>? pools,
      String? message,
      ServiceStatus? status,
      List<File>? orderImages,
      Order? orderOnConfirmation,
      OrderStatus? filter,
      List<RoutePool>? filteredPools}) {
    return OrderState(
        pools: pools ?? this.pools,
        filteredPools: filteredPools ?? this.filteredPools,
        message: message,
        status: status ?? this.status,
        filter: filter ?? this.filter,
        orderImages: orderImages ?? this.orderImages,
        orderOnConfirmation: orderOnConfirmation ?? this.orderOnConfirmation);
  }

  @override
  List<Object?> get props => [
        message,
        pools,
        status,
        filter,
        filteredPools,
        orderImages,
        orderOnConfirmation
      ];
}
