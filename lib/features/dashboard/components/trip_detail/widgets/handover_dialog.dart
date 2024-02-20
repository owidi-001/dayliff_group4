import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/extensions.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(.1),
                  borderRadius: BorderRadius.circular(8)),
              child: const ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  FontAwesomeIcons.locationDot,
                  color: Colors.red,
                ),
                title: Text("Start when at destination"),
                trailing: Icon(
                  FontAwesomeIcons.bell,
                  color: Colors.red,
                ),
              ),
            ),
            const Divider(
              color: Colors.transparent,
              // height: 4,
            ),
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
                widget.order.destination!.name!.capitalize(),
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(FontAwesomeIcons.user),
                title: Text(
                  widget.order.customerName.capitalize(),
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(widget.order.customerPhone),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppUtility.makeCall(widget.order.customerPhone);
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
