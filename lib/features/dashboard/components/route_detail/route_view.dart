import 'dart:async';

import 'package:dayliff/data/service/maps.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/route_detail/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/route_detail/widgets/route_orders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart' as locator;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteView extends StatefulWidget {
  const RouteView({super.key, required this.routeId});
  final int routeId;

  @override
  State<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {
  late RoutePool pool;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    // Get current location
    _getUserLocation();
    // Set pool
    pool = context
        .read<OrderBloc>()
        .state
        .pools
        .firstWhere((route) => route.routeId == widget.routeId);

    _getPolylines();
  }

  LatLng _center = const LatLng(-1.167778, 36.973333);

  Set<Marker> _markers = <Marker>{};
  Set<Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = dotenv.env["MAPS_KEY"]!;

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final coordinates = pool.orders
        .map((e) => LatLng(e.destination!.lat!, e.destination!.long!))
        .toList();
    setState(() {
      _markers.clear();
      _markers = coordinates
          .map(
            (coordinate) => Marker(
              markerId:
                  MarkerId("${coordinate.latitude}${coordinate.longitude}"),
              position: LatLng(coordinate.latitude, coordinate.longitude),
              infoWindow: const InfoWindow(
                title: "Drop Point",
                snippet: "Item x to be dropped here",
              ),
            ),
          )
          .toSet();
    });
  }

  _getPolylines() async {
    pool.orders.map((order) async {
      final point = LatLng(order.destination!.lat!, order.destination!.long!);

      final res = await service<AddressService>()
          .polyline(LatLng(pool.origin!.lat!, pool.origin!.long!), point);
      res.when(onError: (error) {
        // Maybe retry
        print("Error: $error");
      }, onSuccess: (data) {
        print("Data received $data");
        // Add lines to polys
        polylines.addAll(data);
      });
    });
    // remove loading
    loading = false;
    // Update state
    setState(() {});
  }

  Future<void> _getUserLocation() async {
    locator.LocationPermission permission =
        await locator.Geolocator.checkPermission();
    if (permission == locator.LocationPermission.denied) {
      permission = await locator.Geolocator.requestPermission();
      if (permission == locator.LocationPermission.denied) {
        return;
      }
    }
    locator.Position position = await locator.Geolocator.getCurrentPosition(
        desiredAccuracy: locator.LocationAccuracy.high);
    setState(() {
      _center = LatLng(position.latitude, position.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if map is in initial state
    if (context.read<MapsControllerBloc>().state.status ==
        ServiceStatus.initial) {
      context.read<MapsControllerBloc>().add(StartMapsEvent(pool: pool));
    }
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.error,
              )),
          title: Text(
            "${pool.name} Route",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      showDragHandle: true,
                      enableDrag: true,
                      useSafeArea: true,
                      useRootNavigator: true,
                      context: context,
                      builder: (context) => RouteOrders(
                            pool: pool,
                          ));
                },
                icon: const Icon(Icons.more_vert))
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              markers: _markers.toSet(),
              polylines: polylines.toSet(),
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: true,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                ),
              },
            ),
            loading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink()
          ],
        ));
  }
}
