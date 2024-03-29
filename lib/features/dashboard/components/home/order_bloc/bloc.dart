import 'package:dayliff/data/models/messages/app_message.dart';
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

        final res = await _orderService.all();

        res.when(
          onError: (error) {
            if (event.retries == 0) {
              emit(
                state.copyWith(
                    status: ServiceStatus.loadingFailure,
                    message: AppMessage(
                        message: error.error, tone: MessageTone.error)),
              );
            } else {
              add(StartOrderBloc(retries: event.retries -= 1));
            }
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
      emit(state.copyWith(
          message: AppMessage(
              message: "Refreshing trips", tone: MessageTone.loading)));
      final res = await _orderService.all();

      res.when(
        onError: (error) {
          if (event.retries == 0) {
            emit(
              state.copyWith(
                  status: ServiceStatus.loadingFailure,
                  message: AppMessage(
                      message: error.error, tone: MessageTone.error)),
            );
          } else {
            add(RefreshRoutes(retries: event.retries -= 1));
          }
        },
        onSuccess: (data) {
          return emit(state.copyWith(
            status: ServiceStatus.loadingSuccess,
            trips: data,
          ));
        },
      );
    });

    on<ResetOrders>((event, emit) => const OrderState());

    // update trip
    on<UpdateTrip>((event, emit) {
      emit(
        state.copyWith(
          trips: state.trips
              .map((e) => e.id == event.trip.id ? event.trip : e)
              .toList(),
        ),
      );
    });

    // // update order
    on<UpdateOrder>((event, emit) {
      // get the trip
      final Trip trip =
          state.trips.firstWhere((element) => element.id == event.order.trip);
      // Update the trip
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
