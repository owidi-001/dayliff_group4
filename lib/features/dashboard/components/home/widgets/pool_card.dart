import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/route_detail/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/route_detail/route_view.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class RoutePoolCard extends StatelessWidget {
  const RoutePoolCard({super.key, required this.pool});

  final RoutePool pool;

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
    return GestureDetector(
      onTap: () {
        // Update state
        context.read<MapsControllerBloc>().add(StartMapsEvent(pool: pool));
        // Open maps view
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => RouteView(routeId: pool.routeId),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        constraints: const BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: StaticColors.onPrimary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  pool.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  pool.status.toStringValue(),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppUtility.getStatusColor(pool.status, context)),
                )
              ],
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
                            color: StaticColors.primary),
                      ),
                      Text(
                        "${pool.origin!.name}",
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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
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
                            color: StaticColors.primary),
                      ),
                      Text(
                        "${pool.destination!.name}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Update state
                    // context
                    //     .read<MapsControllerBloc>()
                    //     .add(StartMapsEvent(pool: pool));
                    // Open maps view
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RouteView(routeId: pool.routeId),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: StaticColors.primary,
                    foregroundColor: StaticColors.onPrimary,
                    child: const Icon(Icons.chevron_right),
                  ),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Cost:",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: StaticColors.primary),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "KES ",
                    children: [
                      TextSpan(
                          text: AppUtility.formattingAmount(pool.cost),
                          style: TextStyle(color: StaticColors.primary))
                    ],
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Pool card shimmer widgets
class RoutePoolShimmer extends StatelessWidget {
  const RoutePoolShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        constraints: const BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: StaticColors.onPrimary,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
