part of "bloc.dart";

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class StartOrderBloc extends OrderEvent {}

class RefreshRoutes extends OrderEvent {}

class UpdateTrip extends OrderEvent {
  final Trip trip;

  const UpdateTrip({required this.trip});
}



// class UpdateOrder extends OrderEvent {
//   final Order order;

//   const UpdateOrder({required this.order});
// }