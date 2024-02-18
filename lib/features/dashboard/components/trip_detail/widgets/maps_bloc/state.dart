part of 'bloc.dart';

// States
class MapsState extends Equatable {
  final LatLng? currentLocation;
  final List<Polyline> polylines;
  final List<Marker> markers;
  // final List<Marker> companyMarkers;
  // final List<Marker> warehouseMarkers;
  // final List<Marker> orderMarkers;
  final Marker? startPoint;
  final double tilt;
  final double zoom;
  final AppMessage? message;
  final ServiceStatus? status;
  final BitmapDescriptor destinationIcon;
  final BitmapDescriptor warehouseIcon;
  final BitmapDescriptor companyIcon;
  final Trip? pickedRoute;
  final Order? pickedOrder;

  const MapsState(
      {this.currentLocation,
      this.polylines = const [],
      this.markers = const [],
      // this.companyMarkers = const [],
      // this.warehouseMarkers = const [],
      // this.orderMarkers = const [],
      this.startPoint,
      this.tilt = 0.0,
      this.zoom = 14.4,
      this.message,
      this.status = ServiceStatus.initial,
      this.destinationIcon = BitmapDescriptor.defaultMarker,
      this.companyIcon = BitmapDescriptor.defaultMarker,
      this.warehouseIcon = BitmapDescriptor.defaultMarker,
      this.pickedRoute,
      this.pickedOrder});

  MapsState copyWith({
    LatLng? currentLocation,
    List<Polyline>? polylines,
    List<Marker>? markers,
    // List<Marker>? companyMarkers,
    // List<Marker>? warehouseMarkers,
    // List<Marker>? orderMarkers,
    Marker? startPoint,
    AppMessage? message,
    ServiceStatus? status,
    double? tilt,
    BitmapDescriptor? destinationIcon,
    BitmapDescriptor? companyIcon,
    BitmapDescriptor? warehouseIcon,
    double? zoom,
    String? selectedName,
    Trip? pickedRoute,
    Order? pickedOrder,
  }) {
    return MapsState(
      currentLocation: currentLocation ?? this.currentLocation,
      polylines: polylines ?? this.polylines,
      markers: markers ?? this.markers,
      startPoint: startPoint ?? this.startPoint,
      // companyMarkers: companyMarkers ?? this.companyMarkers,
      // orderMarkers: orderMarkers ?? this.orderMarkers,
      // warehouseMarkers: warehouseMarkers ?? this.warehouseMarkers,
      message: message ?? this.message,
      status: status ?? this.status,
      tilt: tilt ?? this.tilt,
      zoom: zoom ?? this.zoom,
      destinationIcon: destinationIcon ?? this.destinationIcon,
      companyIcon: companyIcon ?? this.companyIcon,
      warehouseIcon: warehouseIcon ?? this.warehouseIcon,
      pickedRoute: pickedRoute ?? this.pickedRoute,
      pickedOrder: pickedOrder ?? this.pickedOrder,
    );
  }

  @override
  List<Object?> get props => [
        markers,
        // companyMarkers,
        // warehouseMarkers,
        // orderMarkers,
        currentLocation,
        message,
        status,
        polylines,
        tilt,
        zoom,
        destinationIcon,
        companyIcon,
        warehouseIcon,
        pickedRoute,
        pickedOrder
      ];
}
