import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/home/order_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/extensions.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StartHandOver extends StatefulWidget {
  const StartHandOver({super.key, required this.orderId});
  final int orderId;

  @override
  State<StartHandOver> createState() => _StartHandOverState();
}

class _StartHandOverState extends State<StartHandOver> {
  bool isNavigationComplete = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProcessingCubit, ProcessingState>(
      listener: (context, state) {
        if (state.serviceStarted) {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OrderCompletion(
                orderId: widget.orderId,
              ),
            ),
          );
        }
      },
      listenWhen: (previous, current) =>
          previous.serviceStarted != current.serviceStarted,
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          final order = state.trips
              .expand((trip) => trip.orders)
              .firstWhere((order) => order.orderId == widget.orderId);
          return Dialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            insetPadding: EdgeInsets.symmetric(
                horizontal: 16, vertical: AppBar().preferredSize.height),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Title
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order handover",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(FontAwesomeIcons.xmark))
                      ],
                    ),
                  ),
                  const Divider(
                      // height: 4,
                      ),
                  // Container(
                  //   padding:
                  //       const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  //   margin: const EdgeInsets.symmetric(horizontal: 16),
                  //   decoration: BoxDecoration(
                  //       color: Theme.of(context)
                  //           .colorScheme
                  //           .primary
                  //           .withOpacity(.1),
                  //       borderRadius: BorderRadius.circular(8)),
                  //   child: ListTile(
                  //     onTap: ,
                  //     contentPadding: EdgeInsets.zero,
                  //     leading: Icon(
                  //       FontAwesomeIcons.map,
                  //       color: Theme.of(context).colorScheme.primary,
                  //     ),
                  //     title: Text(
                  //       "Use maps",
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .titleSmall!
                  //           .copyWith(fontWeight: FontWeight.bold)
                  //           .copyWith(
                  //               color: Theme.of(context).colorScheme.primary),
                  //     ),
                  //   ),
                  // ),

                  ListTile(
                    leading: Icon(
                      FontAwesomeIcons.route,
                      size: 36,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      "To",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey),
                    ),
                    subtitle: Text(
                      order.destination!.name!.capitalize(),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: getStatusColor(order.status).withOpacity(.1)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            color: getStatusColor(order.status),
                            size: 8,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            order.status.toStringValue(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: getStatusColor(order.status)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(.5)),
                        borderRadius: BorderRadius.circular(16)),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(FontAwesomeIcons.user),
                      title: Text(
                        order.recipientName.capitalize(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(order.recipientPhone),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              AppUtility.makeCall(order.recipientPhone);
                            },
                            child: CircleAvatar(
                                child: Icon(
                              FontAwesomeIcons.phone,
                              color: StaticColors.primary,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                    // height: 4,
                  ),
                  ListTile(
                    onTap: () {
                      AppUtility.realTimeNavigation(
                        LatLng(
                            order.destination!.lat!, order.destination!.long!),
                      );
                    },
                    leading: const Icon(FontAwesomeIcons.map),
                    title: const Text("Navigate on maps"),
                    trailing: Icon(
                      FontAwesomeIcons.arrowRight,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: BlocBuilder<ProcessingCubit, ProcessingState>(
                      builder: (context, state) {
                        return PrimaryButton(
                            hint: "Begin handover",
                            isLoading: state.status ==
                                ServiceStatus.submissionInProgress,
                            onTap: () {
                              context
                                  .read<ProcessingCubit>()
                                  .beginHandover(order.orderId);
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
