import 'dart:io';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
            // // Set active route
            // Trip? active = data.firstWhere(
            //   (element) => element.status == TripStatus.Active,
            // );
            // // Remove active from schedules
            // final scheduled = data;
            // scheduled.removeWhere((element) => element.id == active.id);
            emit(
              state.copyWith(
                  status: ServiceStatus.loadingSuccess,
                  pools: data,
                  filteredPools: data),
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
        // if (event.filter == OrderStatus.ALL) {
        //   emit(
        //       state.copyWith(filter: event.filter, filteredPools: state.pools));
        // } else {
        //   emit(
        //     state.copyWith(
        //       filter: event.filter,
        //       filteredPools: state.pools
        //           .where((element) => element.status == event.filter)
        //           .toList(),
        //     ),
        //   );
        // }
      },
    );

    on<StartTrip>((event, emit) async {
      final currentLocation = await getCurrentLocation();

      if (currentLocation != null) {
        final res = await _orderService.startTrip(
            LatLng(currentLocation.latitude!, currentLocation.longitude!),
            event.id);
        res.when(onError: (error) {
          // Do nothing
          // TODO
        }, onSuccess: (data) {
          // TODO. emit listener
        });
      }
    });
  }
}

Future<LocationData?> getCurrentLocation() async {
  Location location = Location();
  location.getLocation().then((location) {
    return location;
  });
}
