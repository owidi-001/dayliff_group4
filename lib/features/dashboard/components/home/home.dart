import 'package:cached_network_image/cached_network_image.dart';
import 'package:dayliff/bloc/dashboard/bloc.dart';
import 'package:dayliff/bloc/order/bloc.dart';
import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/pool_card.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  AppUtility.greetingMessage(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 16 / 4,
                ),
                Text(
                  "John Doe",
                  style: Theme.of(context).textTheme.titleMedium!,
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
              ),
            ),
          ],
          bottom: const TabBar(
              // isScrollable: true,
              tabs: [
                Tab(child: Text("Pick ups")),
                Tab(
                  child: Text("Returns"),
                )
              ]),
        ),
        body: const TabBarView(children: [
          PickUps(),
          // Returns
          ReturnOrders(),
        ]),
      )),
    );
  }
}

class ReturnOrders extends StatelessWidget {
  const ReturnOrders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.status == ServiceStatus.loading) {
          return Container(); // TODO: Use shimmers
        }
        if (state.status == ServiceStatus.loadingFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              RetryContainer(
                  description: "Failed to load orders",
                  onTap: () {
                    context.read<OrderBloc>().add(
                        StartOrderBloc()); // TODO! Update to refresh instead
                  },
                  title: "Loading error"),
            ],
          );
        }
        return state.pools.isNotEmpty
            ? SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.pools.length,
                  itemBuilder: (context, index) => AnimateInEffect(
                      keepAlive: true,
                      intervalStart: index / state.pools.length,
                      child: RoutePoolCard(
                        pool: state.pools[index],
                      )),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LottieLoader(name: "empty"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("No pending returns for now")
                ],
              );
      },
    );
  }
}

// Pick ups
class PickUps extends StatelessWidget {
  const PickUps({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.status == ServiceStatus.loading) {
          return Container(); // TODO: Use shimmers
        }
        if (state.status == ServiceStatus.loadingFailure) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              RetryContainer(
                  description: "Failed to load orders",
                  onTap: () {
                    context.read<OrderBloc>().add(
                        StartOrderBloc()); // TODO! Update to refresh instead
                  },
                  title: "Loading error"),
            ],
          );
        }
        return state.pools.isNotEmpty
            ? SingleChildScrollView(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.pools.length,
                  itemBuilder: (context, index) => AnimateInEffect(
                      keepAlive: true,
                      intervalStart: index / state.pools.length,
                      child: RoutePoolCard(
                        pool: state.pools[index],
                      )),
                ),
              )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LottieLoader(name: "empty"),
                  SizedBox(
                    height: 8,
                  ),
                  Text("No pending trips for now")
                ],
              );
      },
    );
  }
}
