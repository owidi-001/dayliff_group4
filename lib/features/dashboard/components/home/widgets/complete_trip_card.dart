import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/trip_details.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/extensions.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompletedCard extends StatelessWidget {
  const CompletedCard({super.key, required this.trip});
  final Trip trip;

  void _showCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CompletedTripDetails(trip: trip),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        onTap: () {
          _showCompleteDialog(context);
        },
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          FontAwesomeIcons.truck,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text((trip.name ?? trip.route.name).capitalize()),
        trailing: Icon(
          FontAwesomeIcons.chevronRight,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class CompletedTripDetails extends StatelessWidget {
  final Trip trip;

  const CompletedTripDetails({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      insetPadding: EdgeInsets.symmetric(
          horizontal: 16, vertical: AppBar().preferredSize.height),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                trip.name ?? trip.route.name.capitalize(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                formatDate(trip.date),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const Divider(
                // color: Colors.transparent,
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "summary".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: StaticColors.dark),
              ),
            ),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16),
              // padding: const EdgeInsets.only(bottom: 8),
              // decoration: BoxDecoration(
              //     border:
              //         Border.all(width: 1, color: Colors.grey.withOpacity(.5)),
              //     borderRadius: BorderRadius.circular(16)),
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
                                        color: getTripStatusColor(trip.status)),
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

            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Addresses".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: StaticColors.dark),
              ),
            ),
            Center(
              child: StopperWidget(
                trip: trip,
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Orders".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: StaticColors.dark),
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ExpansionTile(
                      shape: const Border(),
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      childrenPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            trip.orders[index].bcOrderNumber.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: StaticColors.primary),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: getStatusColor(trip.orders[index].status)
                                    .withOpacity(.1)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.circle,
                                  color:
                                      getStatusColor(trip.orders[index].status),
                                  size: 8,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  trip.orders[index].status.toStringValue(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: getStatusColor(
                                              trip.orders[index].status)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      children: <Widget>[
                        Text(
                          "Deliver to:",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: StaticColors.primary),
                        ),
                        Text(
                            trip.orders[index].destination!.name!.capitalize()),
                        Divider(
                          height: 4,
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.2),
                        ),
                        Text(
                          "Receipient:",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: StaticColors.primary),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            trip.orders[index].recipientName.capitalize(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(trip.orders[index].recipientPhone),
                        ),
                      ],
                    ),
                separatorBuilder: (context, index) => const Divider(
                      indent: 16,
                      endIndent: 16,
                    ),
                itemCount: trip.orders.length)
          ],
        ),
      ),
    );
  }
}
