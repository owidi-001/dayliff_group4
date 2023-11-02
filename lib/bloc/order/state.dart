part of 'bloc.dart';

class OrderState extends Equatable {
  final List<RoutePool> pools;
  final String? message;
  final ServiceStatus status;
  final List<File> orderImages;
  final Order? orderOnConfirmation;

  const OrderState(
      {this.pools = const [],
      this.message,
      this.status = ServiceStatus.initial,
      this.orderImages = const [],
      this.orderOnConfirmation});

  OrderState copyWith(
      {List<RoutePool>? pools,
      String? message,
      ServiceStatus? status,
      List<File>? orderImages,
      Order? orderOnConfirmation}) {
    return OrderState(
        pools: pools ?? this.pools,
        message: message,
        status: status ?? this.status,
        orderImages: orderImages ?? this.orderImages,
        orderOnConfirmation: orderOnConfirmation ?? this.orderOnConfirmation);
  }

  @override
  List<Object?> get props =>
      [message, pools, status, orderImages, orderOnConfirmation];
}
