import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/handover_dialog.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/extensions.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDialog extends StatelessWidget {
  const OrderDialog({super.key, required this.order});
  final Order order;

  _handleHandover(BuildContext context) {
// Open start service
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => StartHandOver(orderId: order.orderId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProcessingCubit, ProcessingState>(
      listener: (context, state) {
        if (state.startNavigationSuccess) {
          // Close this dialog
          Navigator.of(context).pop();
          // Confirm start navigations
          showModalBottomSheet(
            isDismissible: false,
            showDragHandle: true,
            useSafeArea: true,
            useRootNavigator: true,
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Maps Actions",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                            foregroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.onPrimary),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Close this bottomsheet
                            Navigator.of(context).pop();

                            // Start navigation
                            AppUtility.realTimeNavigation(
                              LatLng(order.destination!.lat!,
                                  order.destination!.long!),
                            );
                            _handleHandover(context);
                          },
                          child: const Text("Find route on maps"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStatePropertyAll(
                                Theme.of(context).colorScheme.primary),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary)),
                            ),
                          ),
                          onPressed: () {
                            // Close this bottomsheet
                            Navigator.of(context).pop();
                            // Open start service
                            _handleHandover(context);
                          },
                          child: const Text("Continue without maps"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppBar().preferredSize.height / 2,
                  )
                ],
              ),
            ),
          );
        }
      },
      listenWhen: (previous, current) =>
          previous.startNavigationSuccess != current.startNavigationSuccess,
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
                      "Order Details",
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
                  "#${order.bcOrderNumber}",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: StaticColors.primary),
                ),
                subtitle: Text(
                  formatDate(order.orderDate),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const Divider(
                color: Colors.transparent,
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
              ListTile(
                title: Text(
                  "To",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                subtitle: Text(
                  order.destination!.name!.capitalize(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                dense: true,
                title: Text(
                  "Status:",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                trailing: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: BlocBuilder<ProcessingCubit, ProcessingState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      hint: "Start Navigation",
                      onTap: () {
                        // Make order active
                        context
                            .read<ProcessingCubit>()
                            .startNavigation(order.orderId);
                      },
                      isLoading:
                          state.status == ServiceStatus.submissionInProgress,
                    );
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
