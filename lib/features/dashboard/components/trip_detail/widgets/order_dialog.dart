import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/bloc/bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProcessingCubit, ProcessingState>(
      listener: (context, state) {
        // TODO: implement listener
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 8),
                          child: PrimaryButtonIcon(
                              onTap: () {
                                // Close this bottomsheet
                                Navigator.of(context).pop();

                                // Start navigation
                                AppUtility.realTimeNavigation(
                                  LatLng(order.destination!.lat!,
                                      order.destination!.long!),
                                );
                                // Open start service
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        StartHandOver(order: order));
                              },
                              icon: const Icon(
                                FontAwesomeIcons.map,
                                size: 16,
                              ),
                              hint: "Open maps to location"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              onPressed: () {
                                // Close this bottomsheet
                                Navigator.of(context).pop();
                                // Open start service
                                showDialog(
                                    context: context,
                                    builder: (context) =>
                                        StartHandOver(order: order));
                              },
                              child: const Text("Continue without maps")),
                        )
                      ],
                    ),
                  ));
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
                  "#${order.orderId}",
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
                    order.customerName.capitalize(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(order.customerPhone),
                  trailing: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppUtility.makeCall(order.customerPhone);
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
