import 'dart:io';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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

        final res = await _orderService.all();

        res.when(
          onError: (error) {
            emit(
              state.copyWith(
                  status: ServiceStatus.loadingFailure, message: error.error),
            );
          },
          onSuccess: (data) {
            emit(
              state.copyWith(
                status: ServiceStatus.loadingSuccess,
                trips: data,
              ),
            );
          },
        );
      },
    );

    // Refresh
    on<RefreshRoutes>((event, emit) async {
      final res = await _orderService.all();

      res.when(
        onError: (error) {
          // Do nothing
          debugPrint(error.error);
        },
        onSuccess: (data) {
          return emit(state.copyWith(
            status: ServiceStatus.loadingSuccess,
            trips: data,
          ));
        },
      );
    });

    // update trip
    on<UpdateTrip>((event, emit) {
      emit(state.copyWith(
          trips: state.trips
              .map((e) => e.id == event.trip.id ? event.trip : e)
              .toList()));
    });

    // update order
    on<UpdateOrder>((event, emit) {
      final Trip trip =
          state.trips.firstWhere((element) => element.id == event.order.trip);
      add(
        UpdateTrip(
          trip: trip.copyWith(
            orders: trip.orders
                .map((e) => e.orderId == event.order.orderId ? event.order : e)
                .toList(),
          ),
        ),
      );
    });
  }
}
