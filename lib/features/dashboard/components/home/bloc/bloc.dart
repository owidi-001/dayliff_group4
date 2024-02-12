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
            // Set active route
            final Trip active = data.firstWhere(
              (element) => element.status == TripStatus.ACTIVE,
            );
            // Remove active from schedules
            final scheduled = data
                .removeWhere((element) => element.id == active.id);

            emit(
              state.copyWith(
                status: ServiceStatus.loadingSuccess,
                activeRoute: active,
                pools: data,
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
            pools: data,
          ));
        },
      );
    });

    // Filter
    on<OrdersFiltered>(
      (event, emit) {
        if (event.filter == OrderStatus.ALL) {
          emit(
              state.copyWith(filter: event.filter, filteredPools: state.pools));
        } else {
          emit(
            state.copyWith(
              filter: event.filter,
              filteredPools: state.pools
                  .where((element) => element.status == event.filter)
                  .toList(),
            ),
          );
        }
      },
    );
  }
}
