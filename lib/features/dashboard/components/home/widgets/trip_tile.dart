import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/stop_points.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TripTile extends StatelessWidget {
  const TripTile({super.key, required this.route});
  final RoutePool route;
  void _showConfirmJourneyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => RouteDetails(pool: route),
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
                route.name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: StaticColors.primary,
                    ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery - ${DateFormat.jm().format(route.createdAt)}"
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
                                text: " ${route.orders.length}",
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
                                text: "${route.duration}",
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

// class RouteStops extends StatefulWidget {
//   RouteStops({super.key, required this.pool});
//   final RoutePool pool;

//   @override
//   State<RouteStops> createState() => _RouteStopsState();
// }

// class _RouteStopsState extends State<RouteStops> {
//   int _index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Stepper(
//         currentStep: _index,
//         onStepCancel: () {
//           return;
//         },
//         onStepContinue: () {
//           return;
//         },
//         onStepTapped: (int index) {
//           setState(() {
//             _index = index;
//           });
//         },
//         controlsBuilder: (context, details) => const SizedBox.shrink(),
//         steps: widget.pool.orders
//             .map(
//               (order) => Step(
//                 isActive: true,
//                 title: Text("${order.destination?.name}"),
//                 content: const SizedBox.shrink(),
//               ),
//             )
//             .toList());
//   }
// }