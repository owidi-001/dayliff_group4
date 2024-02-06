import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/route_detail/widgets/maps_view.dart';
import 'package:dayliff/features/dashboard/components/route_detail/widgets/route_orders.dart';
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
        body: SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        children: [
          Expanded(child: MapsView(pool: pool)),
          Expanded(child: RouteOrders(pool: pool))
        ],
      ),
    ));
  }
}
