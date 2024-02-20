import 'package:cached_network_image/cached_network_image.dart';

import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/auth/auth_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/home/order_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/complete_trip_card.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/trip_tile.dart';
import 'package:dayliff/features/dashboard/components/settings/settings.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/empty_list.dart';
import 'package:dayliff/utils/error_container.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dayliff/features/dashboard/components/home/models/route/route.dart'
    as route;

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
        // drawerEnableOpenDragGesture: false,
        // endDrawer: const Drawer(),
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const Settings(),
                        ),
                      );
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
                      "To Do",
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
    if (context.read<OrderBloc>().state.status == ServiceStatus.initial) {
      context.read<OrderBloc>().add(StartOrderBloc());
    }
    return SingleChildScrollView(child: BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.status == ServiceStatus.loading) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => const TripTileShadow(),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.transparent,
            ),
          );
        }
        if (state.status == ServiceStatus.loadingFailure) {
          return ErrorContainerWidget(
            description: "Failed to load completed trips",
            onRefresh: () => context.read<OrderBloc>().add(StartOrderBloc()),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // Refresh orders
            context.read<OrderBloc>().add(RefreshRoutes());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final trips = state.trips
                      .where(
                          (element) => element.status == TripStatus.COMPLETED)
                      .toList();
                  return trips.isNotEmpty
                      ? ListView.separated(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          itemCount: trips.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => AnimateInEffect(
                            keepAlive: true,
                            intervalStart: index / trips.length,
                            child: CompletedCard(
                              trip: trips[index],
                            ),
                          ),
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.transparent,
                          ),
                        )
                      : EmptyListWidget(
                          description: "No completed trips found",
                          onRefresh: () =>
                              context.read<OrderBloc>().add(RefreshRoutes()),
                        );
                },
              ),
            ],
          ),
        );
      },
    ));
  }
}

class Schedules extends StatelessWidget {
  const Schedules({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.read<OrderBloc>().state.status == ServiceStatus.initial) {
      context.read<OrderBloc>().add(StartOrderBloc());
    }
    return SingleChildScrollView(child: BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.status == ServiceStatus.loading) {
          return ListView.separated(
            padding: const EdgeInsets.only(top: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => const TripTileShadow(),
            separatorBuilder: (context, index) => const Divider(
              color: Colors.transparent,
            ),
          );
        }
        if (state.status == ServiceStatus.loadingFailure) {
          return ErrorContainerWidget(
            description: "Failed to load scheduled routes",
            onRefresh: () => context.read<OrderBloc>().add(StartOrderBloc()),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            // Refresh orders
            context.read<OrderBloc>().add(RefreshRoutes());
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return state.trips
                          .where(
                              (element) => element.status == TripStatus.ACTIVE)
                          .isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16),
                          child: Text(
                            "Active Trip",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: StaticColors.dark),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
              // Active Order
              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return state.trips
                          .where(
                              (element) => element.status == TripStatus.ACTIVE)
                          .isNotEmpty
                      ? AnimateInEffect(
                          keepAlive: true,
                          intervalStart: 0,
                          child: TripTile(
                            trip: state.trips.firstWhere((element) =>
                                element.status == route.TripStatus.ACTIVE),
                          ),
                        )
                      : const SizedBox.shrink();
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
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
                      "${state.trips.where((element) => element.status == TripStatus.COMPLETED).length}/${state.trips.length} Completed",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: StaticColors.dark),
                    ),
                  ],
                ),
              ),

              BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return state.trips
                          .where((element) =>
                              element.status != TripStatus.ACTIVE &&
                              element.status != TripStatus.COMPLETED)
                          .isNotEmpty
                      ? ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: state.trips
                              .where((element) =>
                                  element.status != route.TripStatus.ACTIVE &&
                                  element.status != route.TripStatus.COMPLETED)
                              .length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => AnimateInEffect(
                            keepAlive: true,
                            intervalStart: index / 5,
                            child: TripTile(
                              trip: state.trips
                                  .where((element) =>
                                      element.status != TripStatus.ACTIVE &&
                                      element.status != TripStatus.COMPLETED)
                                  .toList()[index],
                            ),
                          ),
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.transparent,
                          ),
                        )
                      : EmptyListWidget(
                          description: "No scheduled routes for now",
                          onRefresh: () =>
                              context.read<OrderBloc>().add(RefreshRoutes()),
                        );
                },
              ),
            ],
          ),
        );
      },
    ));
  }
}
