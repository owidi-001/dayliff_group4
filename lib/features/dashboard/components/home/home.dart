import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/bloc/bloc.dart';
import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/pool_card.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    if (context.read<OrderBloc>().state.status == ServiceStatus.initial) {
      context.read<OrderBloc>().add(StartOrderBloc());
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColorLight,
      ),
    );
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          // Appbar
          SliverAppBar(
            expandedHeight: 180.0,
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            snap: true,
            floating: true,
            pinned: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 16),
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(
                        AppUtility.capitalize(state.user?.name ?? ''),
                        style: Theme.of(context).textTheme.titleMedium!,
                      );
                    },
                  )
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16 / 2),
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
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    constraints: const BoxConstraints(maxHeight: 100),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: DatePicker(
                            DateTime.now(),
                            height: AppBar().preferredSize.height * 1.5,
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Colors.black,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              // New date selected
                              setState(() {
                                _selectedValue = date;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Route Schedule",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          // Routes
          PickUps()
        ],
      )),
    );
  }
}

class PickUps extends StatelessWidget {
  const PickUps({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = List.generate(
      5,
      (index) {
        return dummyRoute;
      },
    );
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (context, index) => AnimateInEffect(
          keepAlive: true,
          intervalStart: index / 5,
          child: RoutePoolCard(
            pool: routes[index],
          )),
    );
  }
}


// TODO! Uncomment when routes apis work
// Pick ups
// class PickUps extends StatelessWidget {
//   const PickUps({super.key});

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
