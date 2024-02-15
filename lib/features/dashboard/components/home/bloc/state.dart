part of 'bloc.dart';

class OrderState extends Equatable {
  final List<Trip> trips;
  final Trip? activeRoute;
  final String? message;
  final ServiceStatus status;
  final List<File> orderImages;
  final Order? orderOnConfirmation;
  // final OrderStatus filter;

  const OrderState({
    this.trips = const [],
    this.message,
    this.activeRoute,
    this.status = ServiceStatus.initial,
    this.orderImages = const [],
    this.orderOnConfirmation,
    // this.filter = OrderStatus.ALL
  });

  OrderState copyWith(
      {List<Trip>? trips,
      String? message,
      Trip? activeRoute,
      ServiceStatus? status,
      List<File>? orderImages,
      Order? orderOnConfirmation,
      OrderStatus? filter}) {
    return OrderState(
        trips: trips ?? this.trips,
        activeRoute: activeRoute ?? this.activeRoute,
        message: message,
        status: status ?? this.status,
        // filter: filter ?? this.filter,
        orderImages: orderImages ?? this.orderImages,
        orderOnConfirmation: orderOnConfirmation ?? this.orderOnConfirmation);
  }

  @override
  List<Object?> get props =>
      [message, activeRoute, trips, status, orderImages, orderOnConfirmation];
}
