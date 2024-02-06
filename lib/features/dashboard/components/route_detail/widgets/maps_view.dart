import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/material.dart';
  
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

class MapsView extends StatefulWidget {
  const MapsView({super.key, required this.pool});
  final RoutePool pool;

  @override
  State<MapsView> createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  late RoutePool pool = widget.pool;

  final Completer<GoogleMapController> _controller = Completer();

  late LatLng source = LatLng(pool.origin!.lat!, pool.origin!.long!);

  late LatLng dest = LatLng(pool.destination!.lat!, pool.destination!.long!);
  List<Marker> markers = [];
  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  // Custom markeys
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    setCustomMarker();
    getPolypoints();
    super.initState();

    // Create markers
    markers = pool.orders
        .map(
          (e) => Marker(
            markerId: MarkerId("${e.orderId}"),
            position: LatLng(e.destination!.lat!, e.destination!.long!),
          ),
        )
        .toList()
      ..addAll([
        Marker(
          markerId: const MarkerId("source"),
          position: source,
        ),
        Marker(markerId: const MarkerId("destination"), position: dest),
      ]);
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
      setState(() {});
    });

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(newLoc.latitude!, newLoc.longitude!),
          ),
        ),
      );
      setState(() {});
    });
  }

  void getPolypoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      dotenv.env["MAPS_KEY"]!,
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(dest.latitude, dest.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((element) {
        polylineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
      setState(() {});
    }
  }

  // void setCustomMarker() {
  //   BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(size: Size(6, 6)),
  //     "assets/markers/source.png",
  //   ).then((value) {
  //     sourceIcon = value;
  //   });
  //   BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(6, 6)),
  //           "assets/markers/destination.png")
  //       .then((value) {
  //     destinationIcon = value;
  //   });
  //   BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(6, 6)),
  //           "assets/markers/current.png")
  //       .then((value) {
  //     currentIcon = value;
  //   });
  // }

  void setCustomMarker() async {
    sourceIcon =
        await _loadAndResizeMarker("assets/markers/source.png", 60, 60);
    destinationIcon =
        await _loadAndResizeMarker("assets/markers/destination.png", 60, 60);
    currentIcon =
        await _loadAndResizeMarker("assets/markers/current.png", 60, 60);
  }

  Future<BitmapDescriptor> _loadAndResizeMarker(
      String assetPath, double width, double height) async {
    ByteData data = await rootBundle.load(assetPath);
    ui.Codec codec =
        await ui.instantiateImageCodec(Uint8List.view(data.buffer));
    ui.FrameInfo fi = await codec.getNextFrame();
    ui.Image image = fi.image;

    Completer<ui.Image> completer = Completer();

    // Resize the image
    ui.decodeImageFromPixels(
      data.buffer.asUint8List(),
      (width.toInt()),
      (height.toInt()),
      ui.PixelFormat.rgba8888,
      (ui.Image decodedImage) {
        completer.complete(decodedImage);
      },
      rowBytes: width.toInt() * 4, // Assuming 4 bytes per pixel (32-bit RGBA)
      targetWidth: width.toInt(),
      targetHeight: height.toInt(),
    );

    ui.Image resizedImage = await completer.future;

    // Convert the resized image to a BitmapDescriptor
    ByteData? resizedByteData = await resizedImage.toByteData(
      format: ui.ImageByteFormat.png,
    );
    Uint8List resizedBytes = resizedByteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(resizedBytes);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      width: double.infinity,
      child: Stack(
        children: [
          currentLocation == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 14.5,
                  ),
                  markers: {
                    ...markers,
                    Marker(
                        markerId: const MarkerId("currentLocation"),
                        position: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        icon: currentIcon)
                  },
                  polylines: {
                    Polyline(
                        polylineId: const PolylineId("route"),
                        points: polylineCoordinates,
                        color: StaticColors.primary,
                        width: 6),
                  },
                  onMapCreated: (mapController) {
                    _controller.complete(mapController);
                  },
                  myLocationEnabled: true,
                ),
          Positioned(
            top: 32,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
