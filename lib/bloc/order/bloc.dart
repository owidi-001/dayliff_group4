import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/utils/info_messages.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part "events.dart";
part 'state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  late OrderService _orderService;
  OrderBloc() : super(const OrderState()) {
    _orderService = service<OrderService>();

    on<StartOrderBloc>(
      (event, emit) async {
        // TODO! Remove this when endpoints are ready
        emit(state.copyWith(
            status: ServiceStatus.loadingSuccess,
            pools: List.generate(10, (index) => dummyRoute),
            message: "Loading success"));

        // TODO! Remove comments when endpoints are ready
        //     emit(
        //       state.copyWith(
        //         status: ServiceStatus.loading,
        //       ),
        //     );
        //     showLoading("Please wait");

        //     final orders = await _orderService.all();
        //     orders.when(
        //       onError: (error) {
        //         showError(error.error);
        //         emit(
        //           state.copyWith(
        //             status: ServiceStatus.loadingFailure,
        //           ),
        //         );
        //       },
        //       onSuccess: (data) {
        //         // Removes loader: Prevents infinite loading after routes are fetched
        //         EasyLoading.dismiss();
        //         return emit(state.copyWith(
        //           status: ServiceStatus.loadingSuccess,
        //           pools: data,
        //         ));
        //       },
        //     );
      },
    );
  }
}

final dummyRoute = RoutePool(
    routeId: -1,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    status: OrderStatus.PENDING,
    distance: 10,
    duration: 20,
    origin:
        const Address(lat: -1.167778, long: 36.973333, name: "Ruiru Warehouse"),
    destination:
        const Address(lat: -1.359227, long: 36.937984, name: "Syokimau"),
    name: "Mombasa RD",
    orders: [
      Order(
        customerName: "John Doe",
        customerPhone: "0791381653",
        orderDate: DateTime.now(),
        status: OrderStatus.PENDING,
        route: -1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        destination:
            const Address(lat: -1.25024, long: 36.94, name: "New Njiru"),
      ),
      Order(
        customerName: "John Doe",
        customerPhone: "0791381653",
        orderDate: DateTime.now(),
        status: OrderStatus.PENDING,
        route: -1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        destination: const Address(lat: 1.17, long: 36.57, name: "Utawala"),
      ),
      Order(
        customerName: "John Doe",
        customerPhone: "0791381653",
        orderDate: DateTime.now(),
        status: OrderStatus.PENDING,
        route: -1,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        destination:
            const Address(lat: -1.359227, long: 36.937984, name: "Syokimau"),
      ),
    ]);
