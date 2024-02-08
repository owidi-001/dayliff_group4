import 'package:cached_network_image/cached_network_image.dart';
import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDialog extends StatefulWidget {
  const OrderDialog({super.key, required this.order, required this.routeName});
  final Order order;
  final String routeName;

  @override
  State<OrderDialog> createState() => _OrderDialogState();
}

class _OrderDialogState extends State<OrderDialog> {
  bool navigationStarted = false;

  Widget _circle(context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Theme.of(context).disabledColor, width: 2),
      ),
      child: const Icon(
        Icons.circle,
        color: Colors.transparent,
        size: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: CachedNetworkImage(
                imageUrl:
                    'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.VonrDB-IhcujNlSbZz99PwHaHa%26pid%3DApi&f=1&ipt=746611e2bfbd9c7ea58f09760890a1ddc5415d56a4f0ba06eb1a4633c5701bd9&ipo=images',
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) => CircleAvatar(
                  backgroundColor: StaticColors.primary,
                  foregroundColor: StaticColors.onPrimary,
                  radius: 22,
                  child: const Icon(Icons.person),
                ),
                errorWidget: (context, url, error) => CircleAvatar(
                  backgroundColor: StaticColors.primary,
                  foregroundColor: StaticColors.onPrimary,
                  radius: 22,
                  child: const Icon(Icons.error),
                ),
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              title: Text(
                widget.order.customerName,
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              subtitle: Text(
                widget.order.customerPhone,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              trailing: GestureDetector(
                  onTap: () {
                    // Call customer
                    AppUtility.makeCall(widget.order.customerPhone);
                  },
                  child: CircleAvatar(
                    backgroundColor: StaticColors.primary,
                    foregroundColor: StaticColors.onPrimary,
                    child: const Icon(Icons.call),
                  )),
            ),
            // const Divider(),
            Column(
              children: [
                Table(
                  border: TableBorder.all(),
                  columnWidths: const {
                    0: FlexColumnWidth(2), // Adjust the column widths as needed
                    1: FlexColumnWidth(3),
                  },
                  children: [
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Order ID:'),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${widget.order.orderId}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: StaticColors.primary),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Order Date:'),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                AppUtility.formatDate(widget.order.orderDate)),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        const TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Status:'),
                          ),
                        ),
                        TableCell(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.order.status.toStringValue(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppUtility.getStatusColor(
                                      widget.order.status, context),
                                ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            PrimaryButton(
                hint: "Start service",
                onTap: () {
                    // close dialog
                    Navigator.of(context).pop();
                    // Go to checkout
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderCompletion(
                          order: widget.order,
                        ),
                      ),
                    );
                  // if (navigationStarted) {
                  //   setState(() {
                  //     navigationStarted = true;
                  //   });
                  //   // close dialog
                  //   Navigator.of(context).pop();
                  //   // Go to checkout
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => OrderCompletion(
                  //         order: widget.order,
                  //       ),
                  //     ),
                  //   );
                  // } else {
                  //   // Start navigation
                  //   AppUtility.realTimeNavigation(
                  //     LatLng(widget.order.destination!.lat!,
                  //         widget.order.destination!.long!),
                  //   );
                  // }
                }),
            SizedBox(
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}
