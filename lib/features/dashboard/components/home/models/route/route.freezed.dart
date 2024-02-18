// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  @JsonKey(name: "trip_id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "route")
  Route get route => throw _privateConstructorUsedError;
  @JsonKey(name: "driver")
  Driver? get driver => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle")
  Vehicle? get vehicle => throw _privateConstructorUsedError;
  @JsonKey(name: "courier")
  Courrier? get courier => throw _privateConstructorUsedError;
  @JsonKey(name: "origin_address")
  Address? get origin => throw _privateConstructorUsedError;
  @JsonKey(name: "tdestination_address")
  Address? get destination => throw _privateConstructorUsedError;
  @JsonKey(name: "trip_distance")
  String? get distance => throw _privateConstructorUsedError;
  @JsonKey(name: "trip_duration")
  int? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "trip_status")
  TripStatus get status => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TripCopyWith<Trip> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TripCopyWith<$Res> {
  factory $TripCopyWith(Trip value, $Res Function(Trip) then) =
      _$TripCopyWithImpl<$Res, Trip>;
  @useResult
  $Res call(
      {@JsonKey(name: "trip_id") int id,
      @JsonKey(name: "route") Route route,
      @JsonKey(name: "driver") Driver? driver,
      @JsonKey(name: "vehicle") Vehicle? vehicle,
      @JsonKey(name: "courier") Courrier? courier,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "tdestination_address") Address? destination,
      @JsonKey(name: "trip_distance") String? distance,
      @JsonKey(name: "trip_duration") int? duration,
      @JsonKey(name: "trip_status") TripStatus status,
      DateTime date,
      List<Order> orders});

  $RouteCopyWith<$Res> get route;
  $DriverCopyWith<$Res>? get driver;
  $VehicleCopyWith<$Res>? get vehicle;
  $CourrierCopyWith<$Res>? get courier;
  $AddressCopyWith<$Res>? get origin;
  $AddressCopyWith<$Res>? get destination;
}

/// @nodoc
class _$TripCopyWithImpl<$Res, $Val extends Trip>
    implements $TripCopyWith<$Res> {
  _$TripCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? route = null,
    Object? driver = freezed,
    Object? vehicle = freezed,
    Object? courier = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? status = null,
    Object? date = null,
    Object? orders = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
      courier: freezed == courier
          ? _value.courier
          : courier // ignore: cast_nullable_to_non_nullable
              as Courrier?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Address?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RouteCopyWith<$Res> get route {
    return $RouteCopyWith<$Res>(_value.route, (value) {
      return _then(_value.copyWith(route: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DriverCopyWith<$Res>? get driver {
    if (_value.driver == null) {
      return null;
    }

    return $DriverCopyWith<$Res>(_value.driver!, (value) {
      return _then(_value.copyWith(driver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VehicleCopyWith<$Res>? get vehicle {
    if (_value.vehicle == null) {
      return null;
    }

    return $VehicleCopyWith<$Res>(_value.vehicle!, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CourrierCopyWith<$Res>? get courier {
    if (_value.courier == null) {
      return null;
    }

    return $CourrierCopyWith<$Res>(_value.courier!, (value) {
      return _then(_value.copyWith(courier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get origin {
    if (_value.origin == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.origin!, (value) {
      return _then(_value.copyWith(origin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get destination {
    if (_value.destination == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.destination!, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "trip_id") int id,
      @JsonKey(name: "route") Route route,
      @JsonKey(name: "driver") Driver? driver,
      @JsonKey(name: "vehicle") Vehicle? vehicle,
      @JsonKey(name: "courier") Courrier? courier,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "tdestination_address") Address? destination,
      @JsonKey(name: "trip_distance") String? distance,
      @JsonKey(name: "trip_duration") int? duration,
      @JsonKey(name: "trip_status") TripStatus status,
      DateTime date,
      List<Order> orders});

  @override
  $RouteCopyWith<$Res> get route;
  @override
  $DriverCopyWith<$Res>? get driver;
  @override
  $VehicleCopyWith<$Res>? get vehicle;
  @override
  $CourrierCopyWith<$Res>? get courier;
  @override
  $AddressCopyWith<$Res>? get origin;
  @override
  $AddressCopyWith<$Res>? get destination;
}

/// @nodoc
class __$$TripImplCopyWithImpl<$Res>
    extends _$TripCopyWithImpl<$Res, _$TripImpl>
    implements _$$TripImplCopyWith<$Res> {
  __$$TripImplCopyWithImpl(_$TripImpl _value, $Res Function(_$TripImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? route = null,
    Object? driver = freezed,
    Object? vehicle = freezed,
    Object? courier = freezed,
    Object? origin = freezed,
    Object? destination = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
    Object? status = null,
    Object? date = null,
    Object? orders = null,
  }) {
    return _then(_$TripImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as Route,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
      courier: freezed == courier
          ? _value.courier
          : courier // ignore: cast_nullable_to_non_nullable
              as Courrier?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Address?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TripImpl with DiagnosticableTreeMixin implements _Trip {
  const _$TripImpl(
      {@JsonKey(name: "trip_id") required this.id,
      @JsonKey(name: "route") required this.route,
      @JsonKey(name: "driver") this.driver,
      @JsonKey(name: "vehicle") this.vehicle,
      @JsonKey(name: "courier") this.courier,
      @JsonKey(name: "origin_address") this.origin,
      @JsonKey(name: "tdestination_address") this.destination,
      @JsonKey(name: "trip_distance") this.distance,
      @JsonKey(name: "trip_duration") this.duration,
      @JsonKey(name: "trip_status") required this.status,
      required this.date,
      final List<Order> orders = const <Order>[]})
      : _orders = orders;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  @JsonKey(name: "trip_id")
  final int id;
  @override
  @JsonKey(name: "route")
  final Route route;
  @override
  @JsonKey(name: "driver")
  final Driver? driver;
  @override
  @JsonKey(name: "vehicle")
  final Vehicle? vehicle;
  @override
  @JsonKey(name: "courier")
  final Courrier? courier;
  @override
  @JsonKey(name: "origin_address")
  final Address? origin;
  @override
  @JsonKey(name: "tdestination_address")
  final Address? destination;
  @override
  @JsonKey(name: "trip_distance")
  final String? distance;
  @override
  @JsonKey(name: "trip_duration")
  final int? duration;
  @override
  @JsonKey(name: "trip_status")
  final TripStatus status;
  @override
  final DateTime date;
  final List<Order> _orders;
  @override
  @JsonKey()
  List<Order> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Trip(id: $id, route: $route, driver: $driver, vehicle: $vehicle, courier: $courier, origin: $origin, destination: $destination, distance: $distance, duration: $duration, status: $status, date: $date, orders: $orders)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Trip'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('route', route))
      ..add(DiagnosticsProperty('driver', driver))
      ..add(DiagnosticsProperty('vehicle', vehicle))
      ..add(DiagnosticsProperty('courier', courier))
      ..add(DiagnosticsProperty('origin', origin))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('distance', distance))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('orders', orders));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TripImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.courier, courier) || other.courier == courier) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      route,
      driver,
      vehicle,
      courier,
      origin,
      destination,
      distance,
      duration,
      status,
      date,
      const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      __$$TripImplCopyWithImpl<_$TripImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TripImplToJson(
      this,
    );
  }
}

abstract class _Trip implements Trip {
  const factory _Trip(
      {@JsonKey(name: "trip_id") required final int id,
      @JsonKey(name: "route") required final Route route,
      @JsonKey(name: "driver") final Driver? driver,
      @JsonKey(name: "vehicle") final Vehicle? vehicle,
      @JsonKey(name: "courier") final Courrier? courier,
      @JsonKey(name: "origin_address") final Address? origin,
      @JsonKey(name: "tdestination_address") final Address? destination,
      @JsonKey(name: "trip_distance") final String? distance,
      @JsonKey(name: "trip_duration") final int? duration,
      @JsonKey(name: "trip_status") required final TripStatus status,
      required final DateTime date,
      final List<Order> orders}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  @JsonKey(name: "trip_id")
  int get id;
  @override
  @JsonKey(name: "route")
  Route get route;
  @override
  @JsonKey(name: "driver")
  Driver? get driver;
  @override
  @JsonKey(name: "vehicle")
  Vehicle? get vehicle;
  @override
  @JsonKey(name: "courier")
  Courrier? get courier;
  @override
  @JsonKey(name: "origin_address")
  Address? get origin;
  @override
  @JsonKey(name: "tdestination_address")
  Address? get destination;
  @override
  @JsonKey(name: "trip_distance")
  String? get distance;
  @override
  @JsonKey(name: "trip_duration")
  int? get duration;
  @override
  @JsonKey(name: "trip_status")
  TripStatus get status;
  @override
  DateTime get date;
  @override
  List<Order> get orders;
  @override
  @JsonKey(ignore: true)
  _$$TripImplCopyWith<_$TripImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return _Driver.fromJson(json);
}

/// @nodoc
mixin _$Driver {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String get license => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverCopyWith<Driver> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverCopyWith<$Res> {
  factory $DriverCopyWith(Driver value, $Res Function(Driver) then) =
      _$DriverCopyWithImpl<$Res, Driver>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "license_number") String license});
}

/// @nodoc
class _$DriverCopyWithImpl<$Res, $Val extends Driver>
    implements $DriverCopyWith<$Res> {
  _$DriverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? license = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverImplCopyWith<$Res> implements $DriverCopyWith<$Res> {
  factory _$$DriverImplCopyWith(
          _$DriverImpl value, $Res Function(_$DriverImpl) then) =
      __$$DriverImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "license_number") String license});
}

/// @nodoc
class __$$DriverImplCopyWithImpl<$Res>
    extends _$DriverCopyWithImpl<$Res, _$DriverImpl>
    implements _$$DriverImplCopyWith<$Res> {
  __$$DriverImplCopyWithImpl(
      _$DriverImpl _value, $Res Function(_$DriverImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? license = null,
  }) {
    return _then(_$DriverImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      license: null == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverImpl with DiagnosticableTreeMixin implements _Driver {
  const _$DriverImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "license_number") required this.license});

  factory _$DriverImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "license_number")
  final String license;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Driver(id: $id, license: $license)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Driver'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('license', license));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.license, license) || other.license == license));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, license);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverImplCopyWith<_$DriverImpl> get copyWith =>
      __$$DriverImplCopyWithImpl<_$DriverImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverImplToJson(
      this,
    );
  }
}

abstract class _Driver implements Driver {
  const factory _Driver(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "license_number") required final String license}) =
      _$DriverImpl;

  factory _Driver.fromJson(Map<String, dynamic> json) = _$DriverImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "license_number")
  String get license;
  @override
  @JsonKey(ignore: true)
  _$$DriverImplCopyWith<_$DriverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  @JsonKey(name: "id")
  int get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: "route_name")
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res, Route>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int routeId,
      @JsonKey(name: "route_name") String name});
}

/// @nodoc
class _$RouteCopyWithImpl<$Res, $Val extends Route>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RouteImplCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$RouteImplCopyWith(
          _$RouteImpl value, $Res Function(_$RouteImpl) then) =
      __$$RouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int routeId,
      @JsonKey(name: "route_name") String name});
}

/// @nodoc
class __$$RouteImplCopyWithImpl<$Res>
    extends _$RouteCopyWithImpl<$Res, _$RouteImpl>
    implements _$$RouteImplCopyWith<$Res> {
  __$$RouteImplCopyWithImpl(
      _$RouteImpl _value, $Res Function(_$RouteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeId = null,
    Object? name = null,
  }) {
    return _then(_$RouteImpl(
      routeId: null == routeId
          ? _value.routeId
          : routeId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteImpl with DiagnosticableTreeMixin implements _Route {
  const _$RouteImpl(
      {@JsonKey(name: "id") required this.routeId,
      @JsonKey(name: "route_name") required this.name});

  factory _$RouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int routeId;
  @override
  @JsonKey(name: "route_name")
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Route(routeId: $routeId, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Route'))
      ..add(DiagnosticsProperty('routeId', routeId))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, routeId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      __$$RouteImplCopyWithImpl<_$RouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteImplToJson(
      this,
    );
  }
}

abstract class _Route implements Route {
  const factory _Route(
      {@JsonKey(name: "id") required final int routeId,
      @JsonKey(name: "route_name") required final String name}) = _$RouteImpl;

  factory _Route.fromJson(Map<String, dynamic> json) = _$RouteImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get routeId;
  @override
  @JsonKey(name: "route_name")
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: "id")
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "trip_id")
  int? get trip => throw _privateConstructorUsedError;
  @JsonKey(name: "destination_address")
  Address? get destination => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_name")
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_phone")
  String get customerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "order_date")
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: "order_status")
  OrderStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? orderId,
      @JsonKey(name: "trip_id") int? trip,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "customer_name") String customerName,
      @JsonKey(name: "customer_phone") String customerPhone,
      @JsonKey(name: "order_date") DateTime orderDate,
      @JsonKey(name: "order_status") OrderStatus status});

  $AddressCopyWith<$Res>? get destination;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? trip = freezed,
    Object? destination = freezed,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? orderDate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as int?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get destination {
    if (_value.destination == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.destination!, (value) {
      return _then(_value.copyWith(destination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? orderId,
      @JsonKey(name: "trip_id") int? trip,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "customer_name") String customerName,
      @JsonKey(name: "customer_phone") String customerPhone,
      @JsonKey(name: "order_date") DateTime orderDate,
      @JsonKey(name: "order_status") OrderStatus status});

  @override
  $AddressCopyWith<$Res>? get destination;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = freezed,
    Object? trip = freezed,
    Object? destination = freezed,
    Object? customerName = null,
    Object? customerPhone = null,
    Object? orderDate = null,
    Object? status = null,
  }) {
    return _then(_$OrderImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      trip: freezed == trip
          ? _value.trip
          : trip // ignore: cast_nullable_to_non_nullable
              as int?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerPhone: null == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl with DiagnosticableTreeMixin implements _Order {
  const _$OrderImpl(
      {@JsonKey(name: "id") this.orderId,
      @JsonKey(name: "trip_id") this.trip,
      @JsonKey(name: "destination_address") this.destination,
      @JsonKey(name: "customer_name") required this.customerName,
      @JsonKey(name: "customer_phone") required this.customerPhone,
      @JsonKey(name: "order_date") required this.orderDate,
      @JsonKey(name: "order_status") required this.status});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? orderId;
  @override
  @JsonKey(name: "trip_id")
  final int? trip;
  @override
  @JsonKey(name: "destination_address")
  final Address? destination;
  @override
  @JsonKey(name: "customer_name")
  final String customerName;
  @override
  @JsonKey(name: "customer_phone")
  final String customerPhone;
  @override
  @JsonKey(name: "order_date")
  final DateTime orderDate;
  @override
  @JsonKey(name: "order_status")
  final OrderStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Order(orderId: $orderId, trip: $trip, destination: $destination, customerName: $customerName, customerPhone: $customerPhone, orderDate: $orderDate, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Order'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('trip', trip))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('customerName', customerName))
      ..add(DiagnosticsProperty('customerPhone', customerPhone))
      ..add(DiagnosticsProperty('orderDate', orderDate))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.trip, trip) || other.trip == trip) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, trip, destination,
      customerName, customerPhone, orderDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
          {@JsonKey(name: "id") final int? orderId,
          @JsonKey(name: "trip_id") final int? trip,
          @JsonKey(name: "destination_address") final Address? destination,
          @JsonKey(name: "customer_name") required final String customerName,
          @JsonKey(name: "customer_phone") required final String customerPhone,
          @JsonKey(name: "order_date") required final DateTime orderDate,
          @JsonKey(name: "order_status") required final OrderStatus status}) =
      _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get orderId;
  @override
  @JsonKey(name: "trip_id")
  int? get trip;
  @override
  @JsonKey(name: "destination_address")
  Address? get destination;
  @override
  @JsonKey(name: "customer_name")
  String get customerName;
  @override
  @JsonKey(name: "customer_phone")
  String get customerPhone;
  @override
  @JsonKey(name: "order_date")
  DateTime get orderDate;
  @override
  @JsonKey(name: "order_status")
  OrderStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "lat")
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: "long")
  double? get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "lat") double? lat,
      @JsonKey(name: "long") double? long});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "lat") double? lat,
      @JsonKey(name: "long") double? long});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_$AddressImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl with DiagnosticableTreeMixin implements _Address {
  const _$AddressImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "lat") this.lat,
      @JsonKey(name: "long") this.long});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "lat")
  final double? lat;
  @override
  @JsonKey(name: "long")
  final double? long;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Address(name: $name, lat: $lat, long: $long)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Address'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('lat', lat))
      ..add(DiagnosticsProperty('long', long));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {@JsonKey(name: "name") final String? name,
      @JsonKey(name: "lat") final double? lat,
      @JsonKey(name: "long") final double? long}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "lat")
  double? get lat;
  @override
  @JsonKey(name: "long")
  double? get long;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Courrier _$CourrierFromJson(Map<String, dynamic> json) {
  return _Courrier.fromJson(json);
}

/// @nodoc
mixin _$Courrier {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "courier_name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "courier_function")
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourrierCopyWith<Courrier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourrierCopyWith<$Res> {
  factory $CourrierCopyWith(Courrier value, $Res Function(Courrier) then) =
      _$CourrierCopyWithImpl<$Res, Courrier>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "courier_name") String? name,
      @JsonKey(name: "courier_function") String? description});
}

/// @nodoc
class _$CourrierCopyWithImpl<$Res, $Val extends Courrier>
    implements $CourrierCopyWith<$Res> {
  _$CourrierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourrierImplCopyWith<$Res>
    implements $CourrierCopyWith<$Res> {
  factory _$$CourrierImplCopyWith(
          _$CourrierImpl value, $Res Function(_$CourrierImpl) then) =
      __$$CourrierImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "courier_name") String? name,
      @JsonKey(name: "courier_function") String? description});
}

/// @nodoc
class __$$CourrierImplCopyWithImpl<$Res>
    extends _$CourrierCopyWithImpl<$Res, _$CourrierImpl>
    implements _$$CourrierImplCopyWith<$Res> {
  __$$CourrierImplCopyWithImpl(
      _$CourrierImpl _value, $Res Function(_$CourrierImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
  }) {
    return _then(_$CourrierImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourrierImpl with DiagnosticableTreeMixin implements _Courrier {
  const _$CourrierImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "courier_name") this.name,
      @JsonKey(name: "courier_function") this.description});

  factory _$CourrierImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourrierImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "courier_name")
  final String? name;
  @override
  @JsonKey(name: "courier_function")
  final String? description;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Courrier(id: $id, name: $name, description: $description)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Courrier'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourrierImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourrierImplCopyWith<_$CourrierImpl> get copyWith =>
      __$$CourrierImplCopyWithImpl<_$CourrierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourrierImplToJson(
      this,
    );
  }
}

abstract class _Courrier implements Courrier {
  const factory _Courrier(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "courier_name") final String? name,
          @JsonKey(name: "courier_function") final String? description}) =
      _$CourrierImpl;

  factory _Courrier.fromJson(Map<String, dynamic> json) =
      _$CourrierImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "courier_name")
  String? get name;
  @override
  @JsonKey(name: "courier_function")
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$CourrierImplCopyWith<_$CourrierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  @JsonKey(name: "vehicle_id")
  int get vehicleId => throw _privateConstructorUsedError;
  @JsonKey(name: "plate_number")
  String? get plateNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "make")
  String? get make => throw _privateConstructorUsedError;
  @JsonKey(name: "model")
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "tonnage")
  String? get tonnage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {@JsonKey(name: "vehicle_id") int vehicleId,
      @JsonKey(name: "plate_number") String? plateNumber,
      @JsonKey(name: "make") String? make,
      @JsonKey(name: "model") String? model,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "tonnage") String? tonnage});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? plateNumber = freezed,
    Object? make = freezed,
    Object? model = freezed,
    Object? type = freezed,
    Object? tonnage = freezed,
  }) {
    return _then(_value.copyWith(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      make: freezed == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tonnage: freezed == tonnage
          ? _value.tonnage
          : tonnage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "vehicle_id") int vehicleId,
      @JsonKey(name: "plate_number") String? plateNumber,
      @JsonKey(name: "make") String? make,
      @JsonKey(name: "model") String? model,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "tonnage") String? tonnage});
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? plateNumber = freezed,
    Object? make = freezed,
    Object? model = freezed,
    Object? type = freezed,
    Object? tonnage = freezed,
  }) {
    return _then(_$VehicleImpl(
      vehicleId: null == vehicleId
          ? _value.vehicleId
          : vehicleId // ignore: cast_nullable_to_non_nullable
              as int,
      plateNumber: freezed == plateNumber
          ? _value.plateNumber
          : plateNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      make: freezed == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tonnage: freezed == tonnage
          ? _value.tonnage
          : tonnage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleImpl with DiagnosticableTreeMixin implements _Vehicle {
  const _$VehicleImpl(
      {@JsonKey(name: "vehicle_id") required this.vehicleId,
      @JsonKey(name: "plate_number") this.plateNumber,
      @JsonKey(name: "make") this.make,
      @JsonKey(name: "model") this.model,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "tonnage") this.tonnage});

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

  @override
  @JsonKey(name: "vehicle_id")
  final int vehicleId;
  @override
  @JsonKey(name: "plate_number")
  final String? plateNumber;
  @override
  @JsonKey(name: "make")
  final String? make;
  @override
  @JsonKey(name: "model")
  final String? model;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "tonnage")
  final String? tonnage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Vehicle(vehicleId: $vehicleId, plateNumber: $plateNumber, make: $make, model: $model, type: $type, tonnage: $tonnage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Vehicle'))
      ..add(DiagnosticsProperty('vehicleId', vehicleId))
      ..add(DiagnosticsProperty('plateNumber', plateNumber))
      ..add(DiagnosticsProperty('make', make))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('tonnage', tonnage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.plateNumber, plateNumber) ||
                other.plateNumber == plateNumber) &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tonnage, tonnage) || other.tonnage == tonnage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, vehicleId, plateNumber, make, model, type, tonnage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(
      this,
    );
  }
}

abstract class _Vehicle implements Vehicle {
  const factory _Vehicle(
      {@JsonKey(name: "vehicle_id") required final int vehicleId,
      @JsonKey(name: "plate_number") final String? plateNumber,
      @JsonKey(name: "make") final String? make,
      @JsonKey(name: "model") final String? model,
      @JsonKey(name: "type") final String? type,
      @JsonKey(name: "tonnage") final String? tonnage}) = _$VehicleImpl;

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

  @override
  @JsonKey(name: "vehicle_id")
  int get vehicleId;
  @override
  @JsonKey(name: "plate_number")
  String? get plateNumber;
  @override
  @JsonKey(name: "make")
  String? get make;
  @override
  @JsonKey(name: "model")
  String? get model;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "tonnage")
  String? get tonnage;
  @override
  @JsonKey(ignore: true)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderConfirmation _$OrderConfirmationFromJson(Map<String, dynamic> json) {
  return _OrderConfirmation.fromJson(json);
}

/// @nodoc
mixin _$OrderConfirmation {
  @JsonKey(name: "order_id")
  int get orderId => throw _privateConstructorUsedError; // validation
  @JsonKey(name: "otp")
  String? get otp => throw _privateConstructorUsedError;
  @JsonKey(name: "receiver_id", includeFromJson: false)
  File? get receiverId => throw _privateConstructorUsedError; // signature
  @JsonKey(name: "Signature", includeFromJson: false)
  Image? get signature => throw _privateConstructorUsedError; // pod
  @JsonKey(name: "order_images", includeFromJson: false)
  List<File> get orderImages => throw _privateConstructorUsedError; // od
  @JsonKey(name: "od_scan", includeFromJson: false)
  File? get odScan => throw _privateConstructorUsedError; // comments
  @JsonKey(name: "comments")
  String? get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderConfirmationCopyWith<OrderConfirmation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderConfirmationCopyWith<$Res> {
  factory $OrderConfirmationCopyWith(
          OrderConfirmation value, $Res Function(OrderConfirmation) then) =
      _$OrderConfirmationCopyWithImpl<$Res, OrderConfirmation>;
  @useResult
  $Res call(
      {@JsonKey(name: "order_id") int orderId,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "receiver_id", includeFromJson: false) File? receiverId,
      @JsonKey(name: "Signature", includeFromJson: false) Image? signature,
      @JsonKey(name: "order_images", includeFromJson: false)
      List<File> orderImages,
      @JsonKey(name: "od_scan", includeFromJson: false) File? odScan,
      @JsonKey(name: "comments") String? comments});
}

/// @nodoc
class _$OrderConfirmationCopyWithImpl<$Res, $Val extends OrderConfirmation>
    implements $OrderConfirmationCopyWith<$Res> {
  _$OrderConfirmationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? otp = freezed,
    Object? receiverId = freezed,
    Object? signature = freezed,
    Object? orderImages = null,
    Object? odScan = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as File?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as Image?,
      orderImages: null == orderImages
          ? _value.orderImages
          : orderImages // ignore: cast_nullable_to_non_nullable
              as List<File>,
      odScan: freezed == odScan
          ? _value.odScan
          : odScan // ignore: cast_nullable_to_non_nullable
              as File?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderConfirmationImplCopyWith<$Res>
    implements $OrderConfirmationCopyWith<$Res> {
  factory _$$OrderConfirmationImplCopyWith(_$OrderConfirmationImpl value,
          $Res Function(_$OrderConfirmationImpl) then) =
      __$$OrderConfirmationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "order_id") int orderId,
      @JsonKey(name: "otp") String? otp,
      @JsonKey(name: "receiver_id", includeFromJson: false) File? receiverId,
      @JsonKey(name: "Signature", includeFromJson: false) Image? signature,
      @JsonKey(name: "order_images", includeFromJson: false)
      List<File> orderImages,
      @JsonKey(name: "od_scan", includeFromJson: false) File? odScan,
      @JsonKey(name: "comments") String? comments});
}

/// @nodoc
class __$$OrderConfirmationImplCopyWithImpl<$Res>
    extends _$OrderConfirmationCopyWithImpl<$Res, _$OrderConfirmationImpl>
    implements _$$OrderConfirmationImplCopyWith<$Res> {
  __$$OrderConfirmationImplCopyWithImpl(_$OrderConfirmationImpl _value,
      $Res Function(_$OrderConfirmationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? otp = freezed,
    Object? receiverId = freezed,
    Object? signature = freezed,
    Object? orderImages = null,
    Object? odScan = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$OrderConfirmationImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: freezed == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as File?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as Image?,
      orderImages: null == orderImages
          ? _value._orderImages
          : orderImages // ignore: cast_nullable_to_non_nullable
              as List<File>,
      odScan: freezed == odScan
          ? _value.odScan
          : odScan // ignore: cast_nullable_to_non_nullable
              as File?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderConfirmationImpl
    with DiagnosticableTreeMixin
    implements _OrderConfirmation {
  const _$OrderConfirmationImpl(
      {@JsonKey(name: "order_id") required this.orderId,
      @JsonKey(name: "otp") this.otp,
      @JsonKey(name: "receiver_id", includeFromJson: false) this.receiverId,
      @JsonKey(name: "Signature", includeFromJson: false) this.signature,
      @JsonKey(name: "order_images", includeFromJson: false)
      final List<File> orderImages = const <File>[],
      @JsonKey(name: "od_scan", includeFromJson: false) this.odScan,
      @JsonKey(name: "comments") this.comments})
      : _orderImages = orderImages;

  factory _$OrderConfirmationImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderConfirmationImplFromJson(json);

  @override
  @JsonKey(name: "order_id")
  final int orderId;
// validation
  @override
  @JsonKey(name: "otp")
  final String? otp;
  @override
  @JsonKey(name: "receiver_id", includeFromJson: false)
  final File? receiverId;
// signature
  @override
  @JsonKey(name: "Signature", includeFromJson: false)
  final Image? signature;
// pod
  final List<File> _orderImages;
// pod
  @override
  @JsonKey(name: "order_images", includeFromJson: false)
  List<File> get orderImages {
    if (_orderImages is EqualUnmodifiableListView) return _orderImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderImages);
  }

// od
  @override
  @JsonKey(name: "od_scan", includeFromJson: false)
  final File? odScan;
// comments
  @override
  @JsonKey(name: "comments")
  final String? comments;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OrderConfirmation(orderId: $orderId, otp: $otp, receiverId: $receiverId, signature: $signature, orderImages: $orderImages, odScan: $odScan, comments: $comments)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OrderConfirmation'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('otp', otp))
      ..add(DiagnosticsProperty('receiverId', receiverId))
      ..add(DiagnosticsProperty('signature', signature))
      ..add(DiagnosticsProperty('orderImages', orderImages))
      ..add(DiagnosticsProperty('odScan', odScan))
      ..add(DiagnosticsProperty('comments', comments));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderConfirmationImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            const DeepCollectionEquality()
                .equals(other._orderImages, _orderImages) &&
            (identical(other.odScan, odScan) || other.odScan == odScan) &&
            (identical(other.comments, comments) ||
                other.comments == comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      otp,
      receiverId,
      signature,
      const DeepCollectionEquality().hash(_orderImages),
      odScan,
      comments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderConfirmationImplCopyWith<_$OrderConfirmationImpl> get copyWith =>
      __$$OrderConfirmationImplCopyWithImpl<_$OrderConfirmationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderConfirmationImplToJson(
      this,
    );
  }
}

abstract class _OrderConfirmation implements OrderConfirmation {
  const factory _OrderConfirmation(
          {@JsonKey(name: "order_id") required final int orderId,
          @JsonKey(name: "otp") final String? otp,
          @JsonKey(name: "receiver_id", includeFromJson: false)
          final File? receiverId,
          @JsonKey(name: "Signature", includeFromJson: false)
          final Image? signature,
          @JsonKey(name: "order_images", includeFromJson: false)
          final List<File> orderImages,
          @JsonKey(name: "od_scan", includeFromJson: false) final File? odScan,
          @JsonKey(name: "comments") final String? comments}) =
      _$OrderConfirmationImpl;

  factory _OrderConfirmation.fromJson(Map<String, dynamic> json) =
      _$OrderConfirmationImpl.fromJson;

  @override
  @JsonKey(name: "order_id")
  int get orderId;
  @override // validation
  @JsonKey(name: "otp")
  String? get otp;
  @override
  @JsonKey(name: "receiver_id", includeFromJson: false)
  File? get receiverId;
  @override // signature
  @JsonKey(name: "Signature", includeFromJson: false)
  Image? get signature;
  @override // pod
  @JsonKey(name: "order_images", includeFromJson: false)
  List<File> get orderImages;
  @override // od
  @JsonKey(name: "od_scan", includeFromJson: false)
  File? get odScan;
  @override // comments
  @JsonKey(name: "comments")
  String? get comments;
  @override
  @JsonKey(ignore: true)
  _$$OrderConfirmationImplCopyWith<_$OrderConfirmationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
