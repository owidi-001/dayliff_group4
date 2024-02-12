part of "bloc.dart";

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class StartOrderBloc extends OrderEvent {}

class OrdersFiltered extends OrderEvent {
  final OrderStatus filter;

  OrdersFiltered({required this.filter});
}

class RefreshRoutes extends OrderEvent {}
