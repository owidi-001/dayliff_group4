import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/handover_dialog.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/order_dialog.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/extensions.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderCard extends StatelessWidget {
  OrderCard({super.key, required this.order});
  final Order order;

  final ExpansionTileController controller = ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (order.status == OrderStatus.COMPLETED) {
          showOverlayMessage(
            AppMessage(
              message: "This order has been delivered successfully!",
              tone: MessageTone.success,
            ),
          );
        } else if (order.status == OrderStatus.CANCELLED) {
          showOverlayMessage(AppMessage(
              message: "This order has been cancelled!",
              tone: MessageTone.warning));
        } else {
          if (order.status == OrderStatus.ACTIVE) {
            // Open start service
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => StartHandOver(orderId: order.orderId));
          } else {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => OrderDialog(
                      order: order,
                    ));
          }
        }
      
      },
      child: Container(
          decoration: BoxDecoration(
              color: StaticColors.onPrimary,
              borderRadius: BorderRadius.circular(8)),
          child: ExpansionTile(
            shape: const Border(),
            controller: controller,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order.bcOrderNumber.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: StaticColors.primary),
                ),
                Container(
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
              ],
            ),
            children: <Widget>[
              Text(
                "Deliver to:",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold, color: StaticColors.primary),
              ),
              Text(order.destination!.name!.capitalize()),
              Divider(
                height: 4,
                color: Theme.of(context).colorScheme.primary.withOpacity(.2),
              ),
              Text(
                "Receipient:",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.bold, color: StaticColors.primary),
              ),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
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
                        if (order.status == OrderStatus.COMPLETED) {
                          showOverlayMessage(AppMessage(
                              message: "Communication with client is disabled",
                              tone: MessageTone.error));
                        } else {
                          AppUtility.makeCall(order.recipientPhone);
                        }
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
            ],
          )),
    );
  }
}
