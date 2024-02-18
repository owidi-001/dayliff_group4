import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/order_dialog.dart';

import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';

class RouteOrders extends StatelessWidget {
  const RouteOrders({super.key, required this.trip});
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height - AppBar().preferredSize.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              "${trip.route.name} Route",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold, color: StaticColors.primary),
            ),
            ListView.separated(
              itemCount: trip.orders.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => AnimateInEffect(
                keepAlive: true,
                intervalStart: index / 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: StaticColors.onPrimary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Name: ",
                            children: [
                              TextSpan(
                                  text: trip.orders[index].customerPhone,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary))
                            ],
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: Colors.black,
                                ),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                          text: "Phone: ",
                          children: [
                            TextSpan(
                                text: trip.orders[index].customerName,
                                style: TextStyle(color: StaticColors.primary))
                          ],
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black,
                                  ),
                        )),
                        RichText(
                            text: TextSpan(
                          text: "To: ",
                          children: [
                            TextSpan(
                                text: '${trip.orders[index].destination?.name}',
                                style: TextStyle(color: StaticColors.primary))
                          ],
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.black,
                                  ),
                        )),
                      ],
                    ),
                    trailing: InkWell(
                      onTap: () {
                        // show dialog
                        showModalBottomSheet(
                            // enableDrag: false,
                            showDragHandle: true,
                            isDismissible: true,
                            useRootNavigator: true,
                            useSafeArea: true,
                            context: context,
                            builder: (context) => OrderDialog(
                                order: trip.orders[index],
                                routeName: trip.origin!.name!));
                      },
                      child: CircleAvatar(
                          backgroundColor: StaticColors.primary,
                          foregroundColor: StaticColors.onPrimary,
                          child: const Icon(Icons.chevron_right)),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: AppBar().preferredSize.height,
            ),
          ],
        ),
      ),
    );
  }
}
