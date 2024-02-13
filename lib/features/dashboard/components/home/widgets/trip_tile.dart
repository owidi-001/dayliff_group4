import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/stop_points.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripTile extends StatelessWidget {
  const TripTile({super.key, required this.trip});
  final Trip trip;
  void _showConfirmJourneyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TripDetails(trip: trip),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _showConfirmJourneyDialog(context);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
              isThreeLine: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              leading: const Icon(Icons.fire_truck),
              title: Text(
                trip.route.name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: StaticColors.primary,
                    ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery - ${DateFormat.jm().format(trip.date)}"
                        .toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: StaticColors.dark,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.circle,
                          size: 8,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Stops:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: StaticColors.dark)),
                            TextSpan(
                                text: " ${trip.orders.length}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: StaticColors.primary)),
                            TextSpan(
                                text: " | ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: StaticColors.primary)),
                            TextSpan(
                                text: "${trip.route.duration}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: StaticColors.primary)),
                            TextSpan(
                                text: " mins",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: StaticColors.dark)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  _showConfirmJourneyDialog(context);
                },
                child: const Icon(Icons.chevron_right),
              )),
        ));
  }
}

class TripTileShadow extends StatelessWidget {
  const TripTileShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        isThreeLine: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        leading: const Skeleton(child: Icon(Icons.fire_truck)),
        title: Skeleton(
          child: Container(
            width: 50,
            height: 12,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(4)),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Skeleton(
                child: Container(
                  width: 150,
                  height: 12,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Skeleton(
                    child: Icon(
                      Icons.circle,
                      size: 8,
                    ),
                  ),
                ),
                Skeleton(
                    child: Container(
                  width: 100,
                  height: 12,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(4)),
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Skeleton(
                child: Container(
                  width: 200,
                  height: 12,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.5),
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ),
          ],
        ),
        trailing: const Skeleton(
          child: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
