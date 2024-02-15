part of 'bloc.dart';

class OrderState extends Equatable {
  final List<Trip> pools;
  final List<Trip> filteredPools;
  final Trip? activeRoute;
  final String? message;
  final ServiceStatus status;
  final List<File> orderImages;
  final Order? orderOnConfirmation;
  // final OrderStatus filter;

  const OrderState(
      {this.pools = const [],
      this.message,
      this.activeRoute,
      this.filteredPools = const [],
      this.status = ServiceStatus.initial,
      this.orderImages = const [],
      this.orderOnConfirmation,
      // this.filter = OrderStatus.ALL
      });

  OrderState copyWith(
      {List<Trip>? pools,
      String? message,
      Trip? activeRoute,
      ServiceStatus? status,
      List<File>? orderImages,
      Order? orderOnConfirmation,
      OrderStatus? filter,
      List<Trip>? filteredPools}) {
    return OrderState(
        pools: pools ?? this.pools,
        activeRoute: activeRoute ?? this.activeRoute,
        filteredPools: filteredPools ?? this.filteredPools,
        message: message,
        status: status ?? this.status,
        // filter: filter ?? this.filter,
        orderImages: orderImages ?? this.orderImages,
        orderOnConfirmation: orderOnConfirmation ?? this.orderOnConfirmation);
  }

  @override
  List<Object?> get props => [
        message,
        activeRoute,
        pools,
        status,
        // filter,
        filteredPools,
        orderImages,
        orderOnConfirmation
      ];
}
