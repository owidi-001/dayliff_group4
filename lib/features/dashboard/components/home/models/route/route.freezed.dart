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

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  @JsonKey(name: "id")
  int get routeId => throw _privateConstructorUsedError;
  @JsonKey(name: "route_name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "origin_address")
  Address? get origin => throw _privateConstructorUsedError;
  @JsonKey(name: "destination_address")
  Address? get destination => throw _privateConstructorUsedError;
  @JsonKey(name: "distance_in_km")
  double? get distance => throw _privateConstructorUsedError;
  @JsonKey(name: "estimated_duration_minutes")
  int? get duration => throw _privateConstructorUsedError;

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
      @JsonKey(name: "route_name") String name,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "distance_in_km") double? distance,
      @JsonKey(name: "estimated_duration_minutes") int? duration});

  $AddressCopyWith<$Res>? get origin;
  $AddressCopyWith<$Res>? get destination;
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
    Object? origin = freezed,
    Object? destination = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
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
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
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
abstract class _$$RouteImplCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$RouteImplCopyWith(
          _$RouteImpl value, $Res Function(_$RouteImpl) then) =
      __$$RouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int routeId,
      @JsonKey(name: "route_name") String name,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "distance_in_km") double? distance,
      @JsonKey(name: "estimated_duration_minutes") int? duration});

  @override
  $AddressCopyWith<$Res>? get origin;
  @override
  $AddressCopyWith<$Res>? get destination;
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
    Object? origin = freezed,
    Object? destination = freezed,
    Object? distance = freezed,
    Object? duration = freezed,
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
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RouteImpl with DiagnosticableTreeMixin implements _Route {
  const _$RouteImpl(
      {@JsonKey(name: "id") required this.routeId,
      @JsonKey(name: "route_name") required this.name,
      @JsonKey(name: "origin_address") this.origin,
      @JsonKey(name: "destination_address") this.destination,
      @JsonKey(name: "distance_in_km") this.distance,
      @JsonKey(name: "estimated_duration_minutes") this.duration});

  factory _$RouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int routeId;
  @override
  @JsonKey(name: "route_name")
  final String name;
  @override
  @JsonKey(name: "origin_address")
  final Address? origin;
  @override
  @JsonKey(name: "destination_address")
  final Address? destination;
  @override
  @JsonKey(name: "distance_in_km")
  final double? distance;
  @override
  @JsonKey(name: "estimated_duration_minutes")
  final int? duration;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Route(routeId: $routeId, name: $name, origin: $origin, destination: $destination, distance: $distance, duration: $duration)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Route'))
      ..add(DiagnosticsProperty('routeId', routeId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('origin', origin))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('distance', distance))
      ..add(DiagnosticsProperty('duration', duration));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, routeId, name, origin, destination, distance, duration);

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
          @JsonKey(name: "route_name") required final String name,
          @JsonKey(name: "origin_address") final Address? origin,
          @JsonKey(name: "destination_address") final Address? destination,
          @JsonKey(name: "distance_in_km") final double? distance,
          @JsonKey(name: "estimated_duration_minutes") final int? duration}) =
      _$RouteImpl;

  factory _Route.fromJson(Map<String, dynamic> json) = _$RouteImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get routeId;
  @override
  @JsonKey(name: "route_name")
  String get name;
  @override
  @JsonKey(name: "origin_address")
  Address? get origin;
  @override
  @JsonKey(name: "destination_address")
  Address? get destination;
  @override
  @JsonKey(name: "distance_in_km")
  double? get distance;
  @override
  @JsonKey(name: "estimated_duration_minutes")
  int? get duration;
  @override
  @JsonKey(ignore: true)
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Trip _$TripFromJson(Map<String, dynamic> json) {
  return _Trip.fromJson(json);
}

/// @nodoc
mixin _$Trip {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "route")
  Route get route => throw _privateConstructorUsedError;
  @JsonKey(name: "driver")
  User? get driver => throw _privateConstructorUsedError;
  @JsonKey(name: "vehicle")
  Vehicle? get vehicle => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "route") Route route,
      @JsonKey(name: "driver") User? driver,
      @JsonKey(name: "vehicle") Vehicle? vehicle,
      TripStatus status,
      DateTime date,
      List<Order> orders});

  $RouteCopyWith<$Res> get route;
  $UserCopyWith<$Res>? get driver;
  $VehicleCopyWith<$Res>? get vehicle;
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
              as User?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
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
  $UserCopyWith<$Res>? get driver {
    if (_value.driver == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.driver!, (value) {
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
}

/// @nodoc
abstract class _$$TripImplCopyWith<$Res> implements $TripCopyWith<$Res> {
  factory _$$TripImplCopyWith(
          _$TripImpl value, $Res Function(_$TripImpl) then) =
      __$$TripImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "route") Route route,
      @JsonKey(name: "driver") User? driver,
      @JsonKey(name: "vehicle") Vehicle? vehicle,
      TripStatus status,
      DateTime date,
      List<Order> orders});

  @override
  $RouteCopyWith<$Res> get route;
  @override
  $UserCopyWith<$Res>? get driver;
  @override
  $VehicleCopyWith<$Res>? get vehicle;
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
              as User?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
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
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "route") required this.route,
      @JsonKey(name: "driver") this.driver,
      @JsonKey(name: "vehicle") this.vehicle,
      required this.status,
      required this.date,
      final List<Order> orders = const <Order>[]})
      : _orders = orders;

  factory _$TripImpl.fromJson(Map<String, dynamic> json) =>
      _$$TripImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "route")
  final Route route;
  @override
  @JsonKey(name: "driver")
  final User? driver;
  @override
  @JsonKey(name: "vehicle")
  final Vehicle? vehicle;
  @override
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
    return 'Trip(id: $id, route: $route, driver: $driver, vehicle: $vehicle, status: $status, date: $date, orders: $orders)';
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
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, route, driver, vehicle,
      status, date, const DeepCollectionEquality().hash(_orders));

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
      {@JsonKey(name: "id") required final int id,
      @JsonKey(name: "route") required final Route route,
      @JsonKey(name: "driver") final User? driver,
      @JsonKey(name: "vehicle") final Vehicle? vehicle,
      required final TripStatus status,
      required final DateTime date,
      final List<Order> orders}) = _$TripImpl;

  factory _Trip.fromJson(Map<String, dynamic> json) = _$TripImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "route")
  Route get route;
  @override
  @JsonKey(name: "driver")
  User? get driver;
  @override
  @JsonKey(name: "vehicle")
  Vehicle? get vehicle;
  @override
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

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: "_id")
  String? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "destination")
  Address? get destination => throw _privateConstructorUsedError;
  @JsonKey(name: "customer")
  User get customer => throw _privateConstructorUsedError;
  @JsonKey(name: "order_date")
  DateTime get orderDate => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: "order_image", includeFromJson: false)
  File? get orderImage => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "_id") String? orderId,
      @JsonKey(name: "destination") Address? destination,
      @JsonKey(name: "customer") User customer,
      @JsonKey(name: "order_date") DateTime orderDate,
      OrderStatus status,
      @JsonKey(name: "order_image", includeFromJson: false) File? orderImage});

  $AddressCopyWith<$Res>? get destination;
  $UserCopyWith<$Res> get customer;
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
    Object? destination = freezed,
    Object? customer = null,
    Object? orderDate = null,
    Object? status = null,
    Object? orderImage = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      orderImage: freezed == orderImage
          ? _value.orderImage
          : orderImage // ignore: cast_nullable_to_non_nullable
              as File?,
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

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get customer {
    return $UserCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
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
      {@JsonKey(name: "_id") String? orderId,
      @JsonKey(name: "destination") Address? destination,
      @JsonKey(name: "customer") User customer,
      @JsonKey(name: "order_date") DateTime orderDate,
      OrderStatus status,
      @JsonKey(name: "order_image", includeFromJson: false) File? orderImage});

  @override
  $AddressCopyWith<$Res>? get destination;
  @override
  $UserCopyWith<$Res> get customer;
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
    Object? destination = freezed,
    Object? customer = null,
    Object? orderDate = null,
    Object? status = null,
    Object? orderImage = freezed,
  }) {
    return _then(_$OrderImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as User,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      orderImage: freezed == orderImage
          ? _value.orderImage
          : orderImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl with DiagnosticableTreeMixin implements _Order {
  const _$OrderImpl(
      {@JsonKey(name: "_id") this.orderId,
      @JsonKey(name: "destination") this.destination,
      @JsonKey(name: "customer") required this.customer,
      @JsonKey(name: "order_date") required this.orderDate,
      required this.status,
      @JsonKey(name: "order_image", includeFromJson: false) this.orderImage});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String? orderId;
  @override
  @JsonKey(name: "destination")
  final Address? destination;
  @override
  @JsonKey(name: "customer")
  final User customer;
  @override
  @JsonKey(name: "order_date")
  final DateTime orderDate;
  @override
  final OrderStatus status;
  @override
  @JsonKey(name: "order_image", includeFromJson: false)
  final File? orderImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Order(orderId: $orderId, destination: $destination, customer: $customer, orderDate: $orderDate, status: $status, orderImage: $orderImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Order'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('customer', customer))
      ..add(DiagnosticsProperty('orderDate', orderDate))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('orderImage', orderImage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderImage, orderImage) ||
                other.orderImage == orderImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, destination, customer,
      orderDate, status, orderImage);

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
      {@JsonKey(name: "_id") final String? orderId,
      @JsonKey(name: "destination") final Address? destination,
      @JsonKey(name: "customer") required final User customer,
      @JsonKey(name: "order_date") required final DateTime orderDate,
      required final OrderStatus status,
      @JsonKey(name: "order_image", includeFromJson: false)
      final File? orderImage}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String? get orderId;
  @override
  @JsonKey(name: "destination")
  Address? get destination;
  @override
  @JsonKey(name: "customer")
  User get customer;
  @override
  @JsonKey(name: "order_date")
  DateTime get orderDate;
  @override
  OrderStatus get status;
  @override
  @JsonKey(name: "order_image", includeFromJson: false)
  File? get orderImage;
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
