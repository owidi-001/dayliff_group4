// import 'dart:async';

// import 'package:dayliff/data/service/maps.dart';
// import 'package:dayliff/data/service/service.dart';
// import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
// import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
// import 'package:dayliff/features/dashboard/components/home/widgets/order_dialog.dart';
// import 'package:dayliff/features/dashboard/components/route_detail/bloc/bloc.dart';
// import 'package:dayliff/features/dashboard/components/route_detail/model/location_result.dart';
// import 'package:dayliff/features/dashboard/components/route_detail/widgets/route_orders.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:geolocator/geolocator.dart' as locator;
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class RouteView extends StatefulWidget {
//   const RouteView({super.key, required this.routeId});
//   final int routeId;

//   @override
//   State<RouteView> createState() => _RouteViewState();
// }

// class _RouteViewState extends State<RouteView> {
//   late RoutePool pool;

//   late Completer<GoogleMapController> _controller;
//   final Set<Marker> _markers = Set();
//   final List<Polyline> _polylines = [];

//   @override
//   void initState() {
//     super.initState();
//     // Get current locatin
//     _getLocation();
//     // start controller
//     _controller = Completer<GoogleMapController>();
//     // selecte pool from existing lists
//     pool = context
//         .read<OrderBloc>()
//         .state
//         .pools
//         .firstWhere((route) => route.routeId == widget.routeId);
//     // Set map details
//     _initMarkers();
//     _initPolylines();
//   }

//   void showOrdersDialog(String value) {
//     switch (value) {
//       case 'Orders':
//         showModalBottomSheet(
//             showDragHandle: true,
//             enableDrag: true,
//             useSafeArea: true,
//             useRootNavigator: true,
//             context: context,
//             builder: (context) => RouteOrders(
//                   pool: pool,
//                 ));
//         break;
//       case 'Close':
//         break;
//     }
//   }

//   Future<LocationResult> _getLocation({int retries = 0}) async {
//     // Determine permission for location
//     locator.LocationPermission? permission =
//         await locator.Geolocator.requestPermission();

//     if (permission == locator.LocationPermission.always ||
//         permission == locator.LocationPermission.whileInUse) {
//       try {
//         final position = await locator.Geolocator.getCurrentPosition(
//           desiredAccuracy: locator.LocationAccuracy.high,
//         );
//         return LocationResult(
//             location: LatLng(position.latitude, position.longitude),
//             permission: permission);
//       } catch (error) {
//         if (retries < 2) {
//           return _getLocation(retries: retries + 1);
//         }
//         return LocationResult(location: null, permission: permission);
//       }
//     } else {
//       if (retries < 2 &&
//           (permission == locator.LocationPermission.denied ||
//               permission == locator.LocationPermission.deniedForever ||
//               permission == locator.LocationPermission.unableToDetermine)) {
//         return _getLocation(retries: retries + 1);
//       } else {
//         return LocationResult(location: null, permission: permission);
//       }
//     }
//   }

// // Create a marker for a given point
//   _buildMarker(LatLng position, onTapEvent, BitmapDescriptor? descriptor) {
//     return Marker(
//       markerId: MarkerId("${position.latitude}${position.longitude}"),
//       icon: descriptor ?? BitmapDescriptor.defaultMarker,
//       position: position,
//       onTap: onTapEvent,
//       infoWindow: const InfoWindow(
//           //  Add title and
//           ),
//     );
//   }

//   // Build markers
//   void _initMarkers() async {
//     pool.orders.map(
//       (e) {
//         final marker = _buildMarker(
//             LatLng(e.destination!.lat!, e.destination!.long!),
//             () {},
//             BitmapDescriptor.defaultMarker);

//         _markers.add(marker);
//       },
//     );
//     // update state
//     setState(() {});
//   }

//   void _initPolylines() async {
//     pool.orders.map((e) async {
//       await service<AddressService>()
//           .polyline(LatLng(pool.origin!.lat!, pool.origin!.long!),
//               LatLng(e.destination!.lat!, e.destination!.long!))
//           .then((value) {
//         value.when(onError: (error) {
//           // showError("Can't determine route for _ to _");
//         }, onSuccess: (data) {
//           [_polylines, data].expand((element) => element).toList();
//           setState(() {});
//         });
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Check if map is in initial state
//     if (context.read<MapsControllerBloc>().state.status ==
//         ServiceStatus.initial) {
//       context.read<MapsControllerBloc>().add(StartMapsEvent(pool: pool));
//     }
//     return BlocListener<MapsControllerBloc, MapsState>(
//       listener: (context, state) {
//         // TODO: implement listener
//         if (state.pickedOrder != null) {
//           showModalBottomSheet(
//               // enableDrag: false,
//               showDragHandle: true,
//               isDismissible: true,
//               useRootNavigator: true,
//               useSafeArea: true,
//               context: context,
//               builder: (context) => OrderDialog(
//                   order: state.pickedOrder!,
//                   routeName: state.pickedRoute!.origin!.name!));
//         }
//       },
//       listenWhen: (previous, current) =>
//           current.pickedOrder != previous.pickedOrder,
//       child: Hero(
//         tag: "xyz",
//         child: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: Icon(
//                   Icons.close,
//                   color: Theme.of(context).colorScheme.error,
//                 )),
//             title: Text(
//               "${pool.name} Route",
//               style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                   fontWeight: FontWeight.bold,
//                   color: Theme.of(context).colorScheme.primary),
//             ),
//             centerTitle: true,
//             actions: [
//               PopupMenuButton<String>(
//                 onSelected: showOrdersDialog,
//                 itemBuilder: (BuildContext context) {
//                   return {'Orders', 'Close'}.map((String choice) {
//                     return PopupMenuItem<String>(
//                       value: choice,
//                       child: Text(choice),
//                     );
//                   }).toList();
//                 },
//               ),
//             ],
//           ),
//           body: GoogleMap(
//             initialCameraPosition: CameraPosition(
//               target: LatLng(pool.origin!.lat!, pool.origin!.long!),
//               zoom: 14,
//               tilt: 0.00,
//             ),
//             onMapCreated: (GoogleMapController controller) {
//               _controller.complete(controller);
//               _controller.future.then((value) => value.setMapStyle(
//                   '[{"featureType": "poi", "elementType": "labels.icon", "stylers": [{"visibility": "off"}]}]'));
//             },
//             mapType: MapType.terrain,
//             markers: _markers.toSet(),
//             polylines: _polylines.toSet(),
//             myLocationEnabled: true,
//             myLocationButtonEnabled: false,
//             rotateGesturesEnabled: true,
//             scrollGesturesEnabled: true,
//             zoomControlsEnabled: false,
//             zoomGesturesEnabled: true,
//             gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
//               Factory<OneSequenceGestureRecognizer>(
//                 () => EagerGestureRecognizer(),
//               ),
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
