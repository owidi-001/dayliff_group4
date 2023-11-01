import 'dart:async';

import 'package:dayliff/bloc/maps/bloc.dart';
import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/widgets/order_dialog.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart' as locator;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteView extends StatefulWidget {
  const RouteView({super.key, required this.route});
  final RoutePool route;

  @override
  State<RouteView> createState() => _RouteViewState();
}

class _RouteViewState extends State<RouteView> {
  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();
    // Check if map is in initial state
    if (context.read<MapsControllerBloc>().state.status ==
        ServiceStatus.initial) {
      context
          .read<MapsControllerBloc>()
          .add(StartMapsEvent(pool: widget.route));
    }
    return BlocListener<MapsControllerBloc, MapsState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.pickedOrder != null) {
          showModalBottomSheet(
              // enableDrag: false,
              showDragHandle: true,
              isDismissible: true,
              useRootNavigator: true,
              useSafeArea: true,
              context: context,
              builder: (context) => OrderDialog(
                  order: state.pickedOrder!,
                  routeName: state.pickedRoute!.origin!.name!));
        }
      },
      listenWhen: (previous, current) =>
          current.pickedOrder != previous.pickedOrder,
      child: BlocBuilder<MapsControllerBloc, MapsState>(
        builder: (context, state) {
          if (state.status == ServiceStatus.loading ||
              state.currentLocation == null) {
            return const Scaffold(
              body: Center(child: LoadingIllustrator()),
            );
          }
          if (state.status == ServiceStatus.loadingFailure) {
            // Check if permission is granted and currentLocation is available
            if (state.permission == locator.LocationPermission.denied ||
                state.permission == locator.LocationPermission.deniedForever ||
                state.permission ==
                    locator.LocationPermission.unableToDetermine) {
              return RetryContainer(
                title: "Permission denied",
                description: "Please enable location access to continue",
                onTap: () {
                  context
                      .read<MapsControllerBloc>()
                      .add(StartMapsEvent(pool: widget.route));
                },
              );
            }
          }
          if (state.status == ServiceStatus.loadingSuccess &&
              state.currentLocation == null) {
            return const Scaffold(
              body: Center(child: LoadingIllustrator()),
            );
          }
          return Hero(
            tag: "xyz",
            child: Scaffold(
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
                  "${widget.route.name} Route",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
                centerTitle: true,
              ),
              body: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: state.currentLocation!,
                  zoom: state.zoom,
                  tilt: state.tilt,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  _controller.future.then((value) => value.setMapStyle(
                      '[{"featureType": "poi", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]}]'));
                },
                mapType: MapType.terrain,
                markers: state.markers.toSet(),
                polylines: state.polylines?.toSet() ?? {},
                circles: {
                  Circle(
                    circleId: const CircleId("current"),
                    center: state.currentLocation!,
                    fillColor: Theme.of(context).primaryColor.withOpacity(.2),
                  )
                },
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
            ),
          );
        },
      ),
    );
  }
}
