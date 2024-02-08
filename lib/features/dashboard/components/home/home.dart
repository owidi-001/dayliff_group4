import 'package:cached_network_image/cached_network_image.dart';

import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/complete_card.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/trip_tile.dart';
import 'package:dayliff/utils/constants.dart';

import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool onDuty = true;
  @override
  Widget build(BuildContext context) {
    if (context.read<OrderBloc>().state.status == ServiceStatus.initial) {
      context.read<OrderBloc>().add(StartOrderBloc());
    }

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      animationDuration: const Duration(milliseconds: 800),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              foregroundColor: StaticColors.onPrimary,
              title: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      AppUtility.greetingMessage(),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: StaticColors.onPrimary),
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return Text(
                          AppUtility.capitalize(state.user?.name ?? ''),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: StaticColors.onPrimary),
                        );
                      },
                    )
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24, top: 16 / 2),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<DashboardControllerBloc>()
                          .add(DashboardEvent(1));
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.VonrDB-IhcujNlSbZz99PwHaHa%26pid%3DApi&f=1&ipt=746611e2bfbd9c7ea58f09760890a1ddc5415d56a4f0ba06eb1a4633c5701bd9&ipo=images',
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 22,
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 22,
                        child: const Icon(Icons.person),
                      ),
                      errorWidget: (context, url, error) => CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 22,
                        child: const Icon(Icons.error),
                      ),
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              expandedHeight: AppBar().preferredSize.height * 3.5,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: StaticColors.onPrimary.withOpacity(.2)),
                      child: ListTile(
                        // tileColor: StaticColors.onPrimary,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        title: Text(
                          onDuty ? "Driver available" : "Not available",
                          style: TextStyle(color: StaticColors.onPrimary),
                        ),
                        trailing: CupertinoSwitch(
                            value: onDuty,
                            onChanged: (bool value) {
                              setState(() {
                                onDuty = value;
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    )
                  ],
                ),
              ),
              bottom: TabBar(
                  // isScrollable: true,
                  indicatorColor: StaticColors.onPrimary.withOpacity(.8),
                  tabs: [
                    Tab(
                        child: Text(
                      "TO DO",
                      style: TextStyle(color: StaticColors.onPrimary),
                    )),
                    Tab(
                      child: Text(
                        "Completed",
                        style: TextStyle(color: StaticColors.onPrimary),
                      ),
                    )
                  ]),
            ),
            const SliverFillRemaining(
              child: TabBarView(children: [
                Schedules(),
                // Returns
                CompleteOrders(),
              ]),
            )
          ],
        ),
      )),
    );
  }
}

class CompleteOrders extends StatelessWidget {
  const CompleteOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => AnimateInEffect(
              keepAlive: true,
              intervalStart: index / 5,
              child: const CompleteCard(),
            ),
          ),
          SizedBox(
            height: AppBar().preferredSize.height,
          )
        ],
      ),
    );
  }
}

class Schedules extends StatelessWidget {
  const Schedules({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Refresh orders
      },
      child: SingleChildScrollView(
          child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Text(
              "Active Trip",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: StaticColors.dark),
            ),
          ),
          // Active Order
          AnimateInEffect(
              keepAlive: true,
              intervalStart: 0,
              child: TripTile(
                route: dummyRoute,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Scheduled Trips",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: StaticColors.dark),
                ),
                Text(
                  "0/2 Completed",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: StaticColors.dark),
                ),
              ],
            ),
          ),
          // Scheduled route
          ...List.generate(
            5,
            (index) => index % 2 == 0
                ? const Divider(
                    color: Colors.transparent,
                  )
                : AnimateInEffect(
                    keepAlive: true,
                    intervalStart: index / 5,
                    child: TripTile(
                      route: dummyRoute,
                    )),
          )
        ],
      )),
    );
  }
}



// TODO! Uncomment when routes apis work
// Pick ups
// class Schedules extends StatelessWidget {
//   const Schedules({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<OrderBloc, OrderState>(
//       builder: (context, state) {
//         if (state.status == ServiceStatus.loading) {
//           return SingleChildScrollView(
//             child: ListView.builder(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               physics: const BouncingScrollPhysics(),
//               itemCount: 8,
//               itemBuilder: (context, index) => AnimateInEffect(
//                   keepAlive: true,
//                   intervalStart: index / 8,
//                   child: const RoutePoolShimmer()),
//             ),
//           );
//         }
//         if (state.status == ServiceStatus.loadingFailure) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               RetryContainer(
//                   description: state.message ?? "Failed to load orders",
//                   onTap: () {
//                     context.read<OrderBloc>().add(
//                         StartOrderBloc()); // TODO! Update to refresh instead
//                   },
//                   title: "An error occurred"),
//             ],
//           );
//         }
//         return state.pools.isNotEmpty
//             ? SingleChildScrollView(
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount: state.pools.length,
//                   itemBuilder: (context, index) => AnimateInEffect(
//                       keepAlive: true,
//                       intervalStart: index / state.pools.length,
//                       child: RoutePoolCard(
//                         pool: state.pools[index],
//                       )),
//                 ),
//               )
//             : const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   LottieLoader(name: "empty"),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Text("No pending trips for now")
//                 ],
//               );
//       },
//     );
//   }
// }