import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/trip_view.dart';
import 'package:dayliff/utils/extensions.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TripDetails extends StatelessWidget {
  final Trip trip;

  const TripDetails({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProcessingCubit, ProcessingState>(
      listener: (context, state) {
        if (state.startTripSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TripView(
                routeId: trip.id,
              ),
            ),
          );
        }
      },
      listenWhen: (previous, current) =>
          previous.startTripSuccess != current.startTripSuccess,
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
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
                      "Trip Details",
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
                height: 4,
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.route,
                  size: 36,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  trip.route.name.capitalize(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  formatDate(trip.date),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(.5)),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "Courrier",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            subtitle: Text(
                              trip.courier!.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "Vehicle",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            subtitle: Text(
                              trip.vehicle!.plateNumber!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "Orders",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            subtitle: Text(
                              "${trip.orders.length} orders",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "Tonnage",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                            subtitle: Text(
                              "${trip.vehicle?.tonnage}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status: ",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: getTripStatusColor(trip.status)
                                    .withOpacity(.1)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: getTripStatusColor(trip.status),
                                  size: 8,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  trip.status.toStringValue(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color:
                                              getTripStatusColor(trip.status)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.transparent,
              ),
              Center(child: StopperWidget(trip: trip)),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: BlocBuilder<ProcessingCubit, ProcessingState>(
                  builder: (context, state) {
                    return PrimaryButton(
                        hint: trip.status == TripStatus.ACTIVE
                            ? "Continue"
                            : "Start trip",
                        onTap: () {
                          if (trip.status != TripStatus.ACTIVE &&
                              context
                                  .read<OrderBloc>()
                                  .state
                                  .trips
                                  .where((e) => e.status == TripStatus.ACTIVE)
                                  .isNotEmpty) {
                            showOverlayMessage(
                              AppMessage(
                                  message: "You already have an active trip",
                                  tone: MessageTone.warning),
                            );
                          } else if (trip.status == TripStatus.ACTIVE) {
                            // select the trip
                            context.read<ProcessingCubit>().selectTrip(trip.id);
                            // Go to next page
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => TripView(
                                  routeId: trip.id,
                                ),
                              ),
                            );
                          } else {
                            // emit start trip event
                            context.read<ProcessingCubit>().startTrip(trip.id);
                          }
                        },
                        isLoading:
                            state.status == ServiceStatus.submissionInProgress);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StopperWidget extends StatelessWidget {
  const StopperWidget({super.key, required this.trip});
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      type: StepperType.vertical,
      steps: [
        Step(
          state: StepState.indexed,
          title: const Text("Origin"),
          subtitle: Text(trip.origin!.name!),
          content: Container(),
          isActive: trip.status != TripStatus.COMPLETED,
        ),
        Step(
          title: const Text("Destination"),
          subtitle: Text(trip.destination?.name ?? "No order destination"),
          content: Container(),
          isActive: trip.status == TripStatus.COMPLETED,
        ),
      ],
      controlsBuilder: (context, details) => const SizedBox.shrink(),
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
