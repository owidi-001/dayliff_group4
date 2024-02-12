import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/route_detail/widgets/maps_view.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteView extends StatelessWidget {
  const RouteView({super.key, required this.routeId});
  final int routeId;

  @override
  Widget build(BuildContext context) {
    final pool = context
        .read<OrderBloc>()
        .state
        .pools
        .firstWhere((route) => route.id == routeId);

    return Scaffold(
        appBar: AppBar(
          title: Text("${pool.route.name} route"),
        ),
        backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Text(
                "Trip Map",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: StaticColors.dark),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                    child: MapsView(trip: pool)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
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
                      ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: pool.orders.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => AnimateInEffect(
                            child: OrderCard(order: pool.orders[index])),
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => OrderDialog(
                  order: order,
                ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: StaticColors.onPrimary,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(FontAwesomeIcons.person),
              title: Text(
                order.customer.name,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(order.customer.name),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      AppUtility.makeCall(order.customer.name);
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
            const Divider(
              height: 0,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "ID: ${order.orderId!}",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: StaticColors.primary),
              ),
              subtitle: Text("To: ${order.destination!.name}"),
              trailing: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
            )
          ],
        ),
      ),
    );
  }
}

class OrderDialog extends StatelessWidget {
  const OrderDialog({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Dialog(
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
              leading: const Icon(
                FontAwesomeIcons.route,
                size: 36,
              ),
              title: Text(
                order.orderId!,
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
              padding: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(FontAwesomeIcons.person),
                title: Text(
                  order.customer.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(order.customer.phoneNumber),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppUtility.makeCall(order.customer.phoneNumber);
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
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              subtitle: Text(
                order.destination!.name!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: PrimaryButton(
                  hint: "Start Navigation",
                  onTap: () {
                    // Close this dialog
                    Navigator.of(context).pop();
                    // Open start service
                    showDialog(
                        context: context,
                        builder: (context) => StartHandOver(order: order));
                    // Start navigation
                    AppUtility.realTimeNavigation(
                      LatLng(order.destination!.lat!, order.destination!.long!),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class StartHandOver extends StatefulWidget {
  const StartHandOver({super.key, required this.order});
  final Order order;

  @override
  State<StartHandOver> createState() => _StartHandOverState();
}

class _StartHandOverState extends State<StartHandOver> {
  bool isNavigationComplete = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
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
              height: 4,
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.route,
                size: 36,
              ),
              title: Text(
                widget.order.orderId!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: StaticColors.primary),
              ),
              subtitle: Text(
                formatDate(widget.order.orderDate),
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
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(FontAwesomeIcons.person),
                title: Text(
                  widget.order.customer.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.order.customer.phoneNumber),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppUtility.makeCall(widget.order.customer.phoneNumber);
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
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              subtitle: Text(
                widget.order.destination!.name!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: getStatusColor(widget.order.status).withOpacity(.1)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.circle,
                      color: getStatusColor(widget.order.status),
                      size: 8,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      widget.order.status.toStringValue(),
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: getStatusColor(widget.order.status)),
                    ),
                  ],
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                FontAwesomeIcons.locationDot,
                color: StaticColors.primary,
              ),
              title: const Text("Reached destination"),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: PrimaryButton(
                  hint: "Begin handover",
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderCompletion(
                          order: widget.order,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
