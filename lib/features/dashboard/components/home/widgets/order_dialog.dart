import 'package:cached_network_image/cached_network_image.dart';
import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/home/order_completion.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDialog extends StatelessWidget {
  const OrderDialog({super.key, required this.order,required this.routeName});
  final Order order;
  final String routeName;

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
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 22,
                child: const Icon(Icons.person),
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 22,
                child: const Icon(Icons.error),
              ),
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            title: Text(
              order.customerName,
              style: Theme.of(context).textTheme.titleMedium!,
            ),
            subtitle: Text(
              order.customerPhone,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: GestureDetector(
                onTap: () {
                  // Call customer
                  AppUtility.makeCall(order.customerPhone);
                },
                child: const CircleAvatar(
                  child: Icon(Icons.call),
                )),
          ),
          const Divider(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _circle(context),
                  SizedBox(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        16,
                        (index) => index != 8
                            ? Expanded(
                                child: Container(
                                  color: index % 2 == 0
                                      ? Colors.transparent
                                      : Theme.of(context).disabledColor,
                                  height: 1,
                                  width: 2,
                                ),
                              )
                            : Container(
                                height: 10,
                                width: 10,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                      width: 2),
                                ),
                                child: const Icon(
                                  Icons.circle,
                                  color: Colors.transparent,
                                  size: 8,
                                ),
                              ),
                      ),
                    ),
                  ),
                  // _circle(),
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).disabledColor,
                    size: 28,
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From:",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      routeName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 16,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) => Icon(
                                        Icons.circle,
                                        size: 5,
                                        color: index % 2 == 0
                                            ? Colors.transparent
                                            : Colors.transparent,
                                      )),
                            ),
                          ]),
                    ),
                    Text(
                      "Dest:",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      "${order.destination!.name}",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  // Start navigation
                  AppUtility.realTimeNavigation(LatLng(
                      order.destination!.lat!, order.destination!.long!));
                },
                child: CircleAvatar(
                  child: Transform.rotate(
                    angle: 45 *
                        (3.141592653589793238 /
                            180), // Convert degrees to radians
                    child: const Icon(Icons.navigation_rounded),
                  ),
                ),
              )
            ],
          ),
          const Divider(),
          AppButton(
              hint: "Confirm order",
              onTap: () {
                // close dialog
                Navigator.of(context).pop();
                // Go to checkout
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderCompletion(
                      order: order,
                    ),
                  ),
                );
              }),
          SizedBox(
            height: AppBar().preferredSize.height,
          )
        ],
      ),
    );
  }
}
