import 'dart:async';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/maps_bloc/bloc.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key, required this.trip});
  final Trip trip;

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  @override
  Widget build(BuildContext context) {
    // Check if map is in initial state
    if (context.read<MapsControllerBloc>().state.status ==
        ServiceStatus.initial) {
      context.read<MapsControllerBloc>().add(StartMapsEvent(pool: widget.trip));
    }

    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();
    return BlocBuilder<MapsControllerBloc, MapsState>(
      builder: (context, state) {
        if (state.status == ServiceStatus.loading ||
            state.currentLocation == null) {
          return const Center(child: LoadingIllustrator());
        }

        if (state.status == ServiceStatus.loadingSuccess &&
            state.currentLocation == null) {
          return const Scaffold(
            body: Center(child: LoadingIllustrator()),
          );
        }
        return GoogleMap(
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
          polylines: state.polylines.toSet(),
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
        );
      },
    );
  }
}
