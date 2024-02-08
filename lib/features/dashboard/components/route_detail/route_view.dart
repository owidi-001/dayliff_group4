import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/order_dialog.dart';
import 'package:dayliff/features/dashboard/components/route_detail/widgets/maps_view.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteView extends StatelessWidget {
  const RouteView({super.key, required this.routeId});
  final int routeId;

  @override
  Widget build(BuildContext context) {
    final pool = context
        .read<OrderBloc>()
        .state
        .pools
        .firstWhere((route) => route.routeId == routeId);

    return Scaffold(
        appBar: AppBar(
          title: Text("${pool.name} route"),
        ),
        body: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(context).height / 2),
              child: Expanded(
                child: Container(
                    constraints: BoxConstraints(
                        maxHeight: MediaQuery.sizeOf(context).height / 2 -
                            AppBar().preferredSize.height),
                    child: MapsView(pool: pool)),
              ),
            ),
            Expanded(
              child: Container(
                // constraints: BoxConstraints(
                //     maxHeight: MediaQuery.sizeOf(context).height / 2),
                decoration: BoxDecoration(color: Colors.grey.shade400),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Text(
                          "Orders",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: StaticColors.dark),
                        ),
                      ),
                      ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        itemCount: pool.orders.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
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
                                      order: pool.orders[index],
                                      routeName: pool.origin!.name!));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: StaticColors.onPrimary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                  isThreeLine: true,
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  title: Text(
                                    pool.orders[index].customerName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          color: StaticColors.primary,
                                        ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pool.orders[index].customerPhone,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: StaticColors.dark,
                                            ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Icon(
                                              Icons.location_history,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "To:",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: StaticColors
                                                                .dark)),
                                                TextSpan(
                                                    text:
                                                        " ${pool.orders[index].destination?.name}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: StaticColors
                                                                .primary)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Icon(
                                              Icons.circle,
                                              size: 8,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "ID:",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: StaticColors
                                                                .primary)),
                                                TextSpan(
                                                    text: pool
                                                        .orders[index].orderId,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: StaticColors
                                                                .dark)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: GestureDetector(
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
                                              order: pool.orders[index],
                                              routeName: pool.origin!.name!));
                                    },
                                    child: const Icon(Icons.chevron_right),
                                  )),
                            )),
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
