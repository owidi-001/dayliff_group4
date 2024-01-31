import 'dart:io';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "events.dart";
part 'state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  late OrderService _orderService;
  OrderBloc() : super(const OrderState()) {
    _orderService = service<OrderService>();

    on<StartOrderBloc>(
      (event, emit) async {
        emit(
          state.copyWith(
            status: ServiceStatus.loading,
          ),
        );
        // TODO! remove when apis are ready
        emit(
          state.copyWith(
            status: ServiceStatus.loadingSuccess,
            pools: List.generate(
              5,
              (index) => dummyRoute,
            ),
          ),
        );
        // TODO! uncomment when apis are ready
        // final orders = await _orderService.all();

        // orders.when(
        //   onError: (error) {
        //     emit(
        //       state.copyWith(
        //           status: ServiceStatus.loadingFailure, message: error.error),
        //     );
        //   },
        //   onSuccess: (data) {
        //     return emit(state.copyWith(
        //       status: ServiceStatus.loadingSuccess,
        //       pools: data,
        //     ));
        //   },
        // );
      },
    );
  }
}
