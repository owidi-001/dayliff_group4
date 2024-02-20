import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/order_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/maps_view.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/order_card.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/extensions.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TripView extends StatelessWidget {
  const TripView({super.key, required this.routeId});
  final int routeId;

  @override
  Widget build(BuildContext context) {
    final pool = context
        .read<OrderBloc>()
        .state
        .trips
        .firstWhere((route) => route.id == routeId);

    return MultiBlocListener(
      listeners: [
        BlocListener<ProcessingCubit, ProcessingState>(
          listener: (context, state) {
            if (state.message != null) {
              showOverlayMessage(state.message!);
            }
          },
          listenWhen: (previous, current) =>
              previous.message != current.message,
        ),
        BlocListener<OrderBloc, OrderState>(
          listener: (context, state) {
            if (state.message != null) {
              showOverlayMessage(state.message!);
            }
          },
          listenWhen: (previous, current) =>
              previous.message != current.message,
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text("${pool.route.name} route".capitalize()),
          ),
          backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.sizeOf(context).height / 2),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: StaticColors.onPrimary,
                        borderRadius: BorderRadius.circular(16)),
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height / 2 -
                            AppBar().preferredSize.height),
                    child: MapsView(trip: pool),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(
                  "Trip Deliveries",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: StaticColors.dark),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        pool.orders.isEmpty
                            ? Container(
                                width: MediaQuery.sizeOf(context).width,
                                padding: const EdgeInsets.all(32),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                                constraints:
                                    const BoxConstraints(maxHeight: 200),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    BlocBuilder<OrderBloc, OrderState>(
                                      builder: (context, state) {
                                        return state.status ==
                                                ServiceStatus.loading
                                            ? const CircularProgressIndicator()
                                            : const SizedBox.shrink();
                                      },
                                    ),
                                    Text(
                                      "No orders in assigned for this trip",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    ElevatedButton.icon(
                                        onPressed: () {
                                          context
                                              .read<OrderBloc>()
                                              .add(RefreshRoutes());
                                        },
                                        icon: const Icon(
                                            FontAwesomeIcons.arrowRotateRight),
                                        label: const Text("refresh"))
                                  ],
                                ),
                              )
                            : ListView.separated(
                                padding: EdgeInsets.zero,
                                itemCount: pool.orders.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) =>
                                    AnimateInEffect(
                                        child: OrderCard(
                                            order: pool.orders[index])),
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                  color: Colors.transparent,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
