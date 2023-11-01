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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoutePool _$RoutePoolFromJson(Map<String, dynamic> json) {
  return _RoutePool.fromJson(json);
}

/// @nodoc
mixin _$RoutePool {
  @JsonKey(name: "route_id")
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
  OrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: "route_cost")
  double get cost => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Driver? get driver => throw _privateConstructorUsedError;
  List<Order> get orders => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutePoolCopyWith<RoutePool> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutePoolCopyWith<$Res> {
  factory $RoutePoolCopyWith(RoutePool value, $Res Function(RoutePool) then) =
      _$RoutePoolCopyWithImpl<$Res, RoutePool>;
  @useResult
  $Res call(
      {@JsonKey(name: "route_id") int routeId,
      @JsonKey(name: "route_name") String name,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "distance_in_km") double? distance,
      @JsonKey(name: "estimated_duration_minutes") int? duration,
      OrderStatus status,
      @JsonKey(name: "route_cost") double cost,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      Driver? driver,
      List<Order> orders});

  $AddressCopyWith<$Res>? get origin;
  $AddressCopyWith<$Res>? get destination;
  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class _$RoutePoolCopyWithImpl<$Res, $Val extends RoutePool>
    implements $RoutePoolCopyWith<$Res> {
  _$RoutePoolCopyWithImpl(this._value, this._then);

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
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? driver = freezed,
    Object? orders = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      orders: null == orders
          ? _value.orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
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
}

/// @nodoc
abstract class _$$RoutePoolImplCopyWith<$Res>
    implements $RoutePoolCopyWith<$Res> {
  factory _$$RoutePoolImplCopyWith(
          _$RoutePoolImpl value, $Res Function(_$RoutePoolImpl) then) =
      __$$RoutePoolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "route_id") int routeId,
      @JsonKey(name: "route_name") String name,
      @JsonKey(name: "origin_address") Address? origin,
      @JsonKey(name: "destination_address") Address? destination,
      @JsonKey(name: "distance_in_km") double? distance,
      @JsonKey(name: "estimated_duration_minutes") int? duration,
      OrderStatus status,
      @JsonKey(name: "route_cost") double cost,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      Driver? driver,
      List<Order> orders});

  @override
  $AddressCopyWith<$Res>? get origin;
  @override
  $AddressCopyWith<$Res>? get destination;
  @override
  $DriverCopyWith<$Res>? get driver;
}

/// @nodoc
class __$$RoutePoolImplCopyWithImpl<$Res>
    extends _$RoutePoolCopyWithImpl<$Res, _$RoutePoolImpl>
    implements _$$RoutePoolImplCopyWith<$Res> {
  __$$RoutePoolImplCopyWithImpl(
      _$RoutePoolImpl _value, $Res Function(_$RoutePoolImpl) _then)
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
    Object? status = null,
    Object? cost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? driver = freezed,
    Object? orders = null,
  }) {
    return _then(_$RoutePoolImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      driver: freezed == driver
          ? _value.driver
          : driver // ignore: cast_nullable_to_non_nullable
              as Driver?,
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<Order>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoutePoolImpl with DiagnosticableTreeMixin implements _RoutePool {
  const _$RoutePoolImpl(
      {@JsonKey(name: "route_id") required this.routeId,
      @JsonKey(name: "route_name") required this.name,
      @JsonKey(name: "origin_address") this.origin,
      @JsonKey(name: "destination_address") this.destination,
      @JsonKey(name: "distance_in_km") this.distance,
      @JsonKey(name: "estimated_duration_minutes") this.duration,
      required this.status,
      @JsonKey(name: "route_cost") this.cost = 0,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      this.driver,
      final List<Order> orders = const <Order>[]})
      : _orders = orders;

  factory _$RoutePoolImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoutePoolImplFromJson(json);

  @override
  @JsonKey(name: "route_id")
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
  final OrderStatus status;
  @override
  @JsonKey(name: "route_cost")
  final double cost;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  final Driver? driver;
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
    return 'RoutePool(routeId: $routeId, name: $name, origin: $origin, destination: $destination, distance: $distance, duration: $duration, status: $status, cost: $cost, createdAt: $createdAt, updatedAt: $updatedAt, driver: $driver, orders: $orders)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutePool'))
      ..add(DiagnosticsProperty('routeId', routeId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('origin', origin))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('distance', distance))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('cost', cost))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('driver', driver))
      ..add(DiagnosticsProperty('orders', orders));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoutePoolImpl &&
            (identical(other.routeId, routeId) || other.routeId == routeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.driver, driver) || other.driver == driver) &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      routeId,
      name,
      origin,
      destination,
      distance,
      duration,
      status,
      cost,
      createdAt,
      updatedAt,
      driver,
      const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoutePoolImplCopyWith<_$RoutePoolImpl> get copyWith =>
      __$$RoutePoolImplCopyWithImpl<_$RoutePoolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoutePoolImplToJson(
      this,
    );
  }
}

abstract class _RoutePool implements RoutePool {
  const factory _RoutePool(
      {@JsonKey(name: "route_id") required final int routeId,
      @JsonKey(name: "route_name") required final String name,
      @JsonKey(name: "origin_address") final Address? origin,
      @JsonKey(name: "destination_address") final Address? destination,
      @JsonKey(name: "distance_in_km") final double? distance,
      @JsonKey(name: "estimated_duration_minutes") final int? duration,
      required final OrderStatus status,
      @JsonKey(name: "route_cost") final double cost,
      @JsonKey(name: "created_at") required final DateTime createdAt,
      @JsonKey(name: "updated_at") required final DateTime updatedAt,
      final Driver? driver,
      final List<Order> orders}) = _$RoutePoolImpl;

  factory _RoutePool.fromJson(Map<String, dynamic> json) =
      _$RoutePoolImpl.fromJson;

  @override
  @JsonKey(name: "route_id")
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
  OrderStatus get status;
  @override
  @JsonKey(name: "route_cost")
  double get cost;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @override
  Driver? get driver;
  @override
  List<Order> get orders;
  @override
  @JsonKey(ignore: true)
  _$$RoutePoolImplCopyWith<_$RoutePoolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
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
      {String? name,
      @JsonKey(name: "longitude") double? lat,
      @JsonKey(name: "latitude") double? long});
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
      {String? name,
      @JsonKey(name: "longitude") double? lat,
      @JsonKey(name: "latitude") double? long});
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
      {this.name,
      @JsonKey(name: "longitude") this.lat,
      @JsonKey(name: "latitude") this.long});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  final String? name;
  @override
  @JsonKey(name: "longitude")
  final double? lat;
  @override
  @JsonKey(name: "latitude")
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
  bool operator ==(dynamic other) {
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
      {final String? name,
      @JsonKey(name: "longitude") final double? lat,
      @JsonKey(name: "latitude") final double? long}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  String? get name;
  @override
  @JsonKey(name: "longitude")
  double? get lat;
  @override
  @JsonKey(name: "latitude")
  double? get long;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Driver _$DriverFromJson(Map<String, dynamic> json) {
  return _Driver.fromJson(json);
}

/// @nodoc
mixin _$Driver {
  @JsonKey(name: "driver_id")
  int? get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String? get license => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "driver_id") int? driverId,
      @JsonKey(name: "name") String? firstName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phone,
      @JsonKey(name: "license_number") String? license});
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
    Object? driverId = freezed,
    Object? firstName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? license = freezed,
  }) {
    return _then(_value.copyWith(
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: "driver_id") int? driverId,
      @JsonKey(name: "name") String? firstName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phone,
      @JsonKey(name: "license_number") String? license});
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
    Object? driverId = freezed,
    Object? firstName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? license = freezed,
  }) {
    return _then(_$DriverImpl(
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverImpl with DiagnosticableTreeMixin implements _Driver {
  const _$DriverImpl(
      {@JsonKey(name: "driver_id") this.driverId,
      @JsonKey(name: "name") this.firstName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phone,
      @JsonKey(name: "license_number") this.license});

  factory _$DriverImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverImplFromJson(json);

  @override
  @JsonKey(name: "driver_id")
  final int? driverId;
  @override
  @JsonKey(name: "name")
  final String? firstName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phone;
  @override
  @JsonKey(name: "license_number")
  final String? license;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Driver(driverId: $driverId, firstName: $firstName, email: $email, phone: $phone, license: $license)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Driver'))
      ..add(DiagnosticsProperty('driverId', driverId))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('license', license));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverImpl &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.license, license) || other.license == license));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, driverId, firstName, email, phone, license);

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
      {@JsonKey(name: "driver_id") final int? driverId,
      @JsonKey(name: "name") final String? firstName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone_number") final String? phone,
      @JsonKey(name: "license_number") final String? license}) = _$DriverImpl;

  factory _Driver.fromJson(Map<String, dynamic> json) = _$DriverImpl.fromJson;

  @override
  @JsonKey(name: "driver_id")
  int? get driverId;
  @override
  @JsonKey(name: "name")
  String? get firstName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phone;
  @override
  @JsonKey(name: "license_number")
  String? get license;
  @override
  @JsonKey(ignore: true)
  _$$DriverImplCopyWith<_$DriverImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DriverUpdate _$DriverUpdateFromJson(Map<String, dynamic> json) {
  return _DriverUpdate.fromJson(json);
}

/// @nodoc
mixin _$DriverUpdate {
  @JsonKey(name: "name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "license_number")
  String? get license => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverUpdateCopyWith<DriverUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverUpdateCopyWith<$Res> {
  factory $DriverUpdateCopyWith(
          DriverUpdate value, $Res Function(DriverUpdate) then) =
      _$DriverUpdateCopyWithImpl<$Res, DriverUpdate>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? firstName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phone,
      @JsonKey(name: "license_number") String? license});
}

/// @nodoc
class _$DriverUpdateCopyWithImpl<$Res, $Val extends DriverUpdate>
    implements $DriverUpdateCopyWith<$Res> {
  _$DriverUpdateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? license = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverUpdateImplCopyWith<$Res>
    implements $DriverUpdateCopyWith<$Res> {
  factory _$$DriverUpdateImplCopyWith(
          _$DriverUpdateImpl value, $Res Function(_$DriverUpdateImpl) then) =
      __$$DriverUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? firstName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phone,
      @JsonKey(name: "license_number") String? license});
}

/// @nodoc
class __$$DriverUpdateImplCopyWithImpl<$Res>
    extends _$DriverUpdateCopyWithImpl<$Res, _$DriverUpdateImpl>
    implements _$$DriverUpdateImplCopyWith<$Res> {
  __$$DriverUpdateImplCopyWithImpl(
      _$DriverUpdateImpl _value, $Res Function(_$DriverUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? license = freezed,
  }) {
    return _then(_$DriverUpdateImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      license: freezed == license
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverUpdateImpl with DiagnosticableTreeMixin implements _DriverUpdate {
  const _$DriverUpdateImpl(
      {@JsonKey(name: "name") this.firstName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phone,
      @JsonKey(name: "license_number") this.license});

  factory _$DriverUpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverUpdateImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? firstName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phone;
  @override
  @JsonKey(name: "license_number")
  final String? license;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DriverUpdate(firstName: $firstName, email: $email, phone: $phone, license: $license)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DriverUpdate'))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('phone', phone))
      ..add(DiagnosticsProperty('license', license));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverUpdateImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.license, license) || other.license == license));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, email, phone, license);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverUpdateImplCopyWith<_$DriverUpdateImpl> get copyWith =>
      __$$DriverUpdateImplCopyWithImpl<_$DriverUpdateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverUpdateImplToJson(
      this,
    );
  }
}

abstract class _DriverUpdate implements DriverUpdate {
  const factory _DriverUpdate(
          {@JsonKey(name: "name") final String? firstName,
          @JsonKey(name: "email") final String? email,
          @JsonKey(name: "phone_number") final String? phone,
          @JsonKey(name: "license_number") final String? license}) =
      _$DriverUpdateImpl;

  factory _DriverUpdate.fromJson(Map<String, dynamic> json) =
      _$DriverUpdateImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get firstName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phone;
  @override
  @JsonKey(name: "license_number")
  String? get license;
  @override
  @JsonKey(ignore: true)
  _$$DriverUpdateImplCopyWith<_$DriverUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  @JsonKey(name: "order_id")
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_name")
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: "customer_phone")
  String get customerPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "order_date")
  DateTime get orderDate => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery_date")
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: "destination_address")
  Address? get destination => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: "route_id")
  int get route => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery_confirmation")
  DeliveryConfirmation? get deliveryConfirmation =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "Signature", includeFromJson: false)
  File? get signature => throw _privateConstructorUsedError;
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
      {@JsonKey(name: "order_id") int? orderId,
      @JsonKey(name: "customer_name") String customerName,
      @JsonKey(name: "customer_phone") String customerPhone,
      @JsonKey(name: "order_date") DateTime orderDate,
      @JsonKey(name: "delivery_date") DateTime? deliveryDate,
      @JsonKey(name: "destination_address") Address? destination,
      OrderStatus status,
      @JsonKey(name: "route_id") int route,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "delivery_confirmation")
      DeliveryConfirmation? deliveryConfirmation,
      @JsonKey(name: "Signature", includeFromJson: false) File? signature,
      @JsonKey(name: "order_image", includeFromJson: false) File? orderImage});

  $AddressCopyWith<$Res>? get destination;
  $DeliveryConfirmationCopyWith<$Res>? get deliveryConfirmation;
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
    Object? customerName = null,
    Object? customerPhone = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? destination = freezed,
    Object? status = null,
    Object? route = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryConfirmation = freezed,
    Object? signature = freezed,
    Object? orderImage = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryConfirmation: freezed == deliveryConfirmation
          ? _value.deliveryConfirmation
          : deliveryConfirmation // ignore: cast_nullable_to_non_nullable
              as DeliveryConfirmation?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as File?,
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
  $DeliveryConfirmationCopyWith<$Res>? get deliveryConfirmation {
    if (_value.deliveryConfirmation == null) {
      return null;
    }

    return $DeliveryConfirmationCopyWith<$Res>(_value.deliveryConfirmation!,
        (value) {
      return _then(_value.copyWith(deliveryConfirmation: value) as $Val);
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
      {@JsonKey(name: "order_id") int? orderId,
      @JsonKey(name: "customer_name") String customerName,
      @JsonKey(name: "customer_phone") String customerPhone,
      @JsonKey(name: "order_date") DateTime orderDate,
      @JsonKey(name: "delivery_date") DateTime? deliveryDate,
      @JsonKey(name: "destination_address") Address? destination,
      OrderStatus status,
      @JsonKey(name: "route_id") int route,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      @JsonKey(name: "delivery_confirmation")
      DeliveryConfirmation? deliveryConfirmation,
      @JsonKey(name: "Signature", includeFromJson: false) File? signature,
      @JsonKey(name: "order_image", includeFromJson: false) File? orderImage});

  @override
  $AddressCopyWith<$Res>? get destination;
  @override
  $DeliveryConfirmationCopyWith<$Res>? get deliveryConfirmation;
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
    Object? customerName = null,
    Object? customerPhone = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? destination = freezed,
    Object? status = null,
    Object? route = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deliveryConfirmation = freezed,
    Object? signature = freezed,
    Object? orderImage = freezed,
  }) {
    return _then(_$OrderImpl(
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
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
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      destination: freezed == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as Address?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      route: null == route
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryConfirmation: freezed == deliveryConfirmation
          ? _value.deliveryConfirmation
          : deliveryConfirmation // ignore: cast_nullable_to_non_nullable
              as DeliveryConfirmation?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as File?,
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
      {@JsonKey(name: "order_id") this.orderId,
      @JsonKey(name: "customer_name") required this.customerName,
      @JsonKey(name: "customer_phone") required this.customerPhone,
      @JsonKey(name: "order_date") required this.orderDate,
      @JsonKey(name: "delivery_date") this.deliveryDate,
      @JsonKey(name: "destination_address") this.destination,
      required this.status,
      @JsonKey(name: "route_id") required this.route,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      @JsonKey(name: "delivery_confirmation") this.deliveryConfirmation,
      @JsonKey(name: "Signature", includeFromJson: false) this.signature,
      @JsonKey(name: "order_image", includeFromJson: false) this.orderImage});

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  @JsonKey(name: "order_id")
  final int? orderId;
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
  @JsonKey(name: "delivery_date")
  final DateTime? deliveryDate;
  @override
  @JsonKey(name: "destination_address")
  final Address? destination;
  @override
  final OrderStatus status;
  @override
  @JsonKey(name: "route_id")
  final int route;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  @JsonKey(name: "delivery_confirmation")
  final DeliveryConfirmation? deliveryConfirmation;
  @override
  @JsonKey(name: "Signature", includeFromJson: false)
  final File? signature;
  @override
  @JsonKey(name: "order_image", includeFromJson: false)
  final File? orderImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Order(orderId: $orderId, customerName: $customerName, customerPhone: $customerPhone, orderDate: $orderDate, deliveryDate: $deliveryDate, destination: $destination, status: $status, route: $route, createdAt: $createdAt, updatedAt: $updatedAt, deliveryConfirmation: $deliveryConfirmation, signature: $signature, orderImage: $orderImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Order'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('customerName', customerName))
      ..add(DiagnosticsProperty('customerPhone', customerPhone))
      ..add(DiagnosticsProperty('orderDate', orderDate))
      ..add(DiagnosticsProperty('deliveryDate', deliveryDate))
      ..add(DiagnosticsProperty('destination', destination))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('route', route))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('deliveryConfirmation', deliveryConfirmation))
      ..add(DiagnosticsProperty('signature', signature))
      ..add(DiagnosticsProperty('orderImage', orderImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.route, route) || other.route == route) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deliveryConfirmation, deliveryConfirmation) ||
                other.deliveryConfirmation == deliveryConfirmation) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.orderImage, orderImage) ||
                other.orderImage == orderImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      orderId,
      customerName,
      customerPhone,
      orderDate,
      deliveryDate,
      destination,
      status,
      route,
      createdAt,
      updatedAt,
      deliveryConfirmation,
      signature,
      orderImage);

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
      {@JsonKey(name: "order_id") final int? orderId,
      @JsonKey(name: "customer_name") required final String customerName,
      @JsonKey(name: "customer_phone") required final String customerPhone,
      @JsonKey(name: "order_date") required final DateTime orderDate,
      @JsonKey(name: "delivery_date") final DateTime? deliveryDate,
      @JsonKey(name: "destination_address") final Address? destination,
      required final OrderStatus status,
      @JsonKey(name: "route_id") required final int route,
      @JsonKey(name: "created_at") required final DateTime createdAt,
      @JsonKey(name: "updated_at") required final DateTime updatedAt,
      @JsonKey(name: "delivery_confirmation")
      final DeliveryConfirmation? deliveryConfirmation,
      @JsonKey(name: "Signature", includeFromJson: false) final File? signature,
      @JsonKey(name: "order_image", includeFromJson: false)
      final File? orderImage}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  @JsonKey(name: "order_id")
  int? get orderId;
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
  @JsonKey(name: "delivery_date")
  DateTime? get deliveryDate;
  @override
  @JsonKey(name: "destination_address")
  Address? get destination;
  @override
  OrderStatus get status;
  @override
  @JsonKey(name: "route_id")
  int get route;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @override
  @JsonKey(name: "delivery_confirmation")
  DeliveryConfirmation? get deliveryConfirmation;
  @override
  @JsonKey(name: "Signature", includeFromJson: false)
  File? get signature;
  @override
  @JsonKey(name: "order_image", includeFromJson: false)
  File? get orderImage;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryConfirmation _$DeliveryConfirmationFromJson(Map<String, dynamic> json) {
  return _DeliveryConfirmation.fromJson(json);
}

/// @nodoc
mixin _$DeliveryConfirmation {
  @JsonKey(name: "confirmation_id")
  int? get confirmationId => throw _privateConstructorUsedError;
  @JsonKey(name: "order_id")
  int? get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: "confirmation_date")
  DateTime? get dateConfirmed => throw _privateConstructorUsedError;
  @JsonKey(name: "recipient_name")
  String get recipient => throw _privateConstructorUsedError;
  @JsonKey(name: "signature_image", includeFromJson: false)
  File? get signature => throw _privateConstructorUsedError;
  @JsonKey(name: "order_image", includeFromJson: false)
  File? get orderImage => throw _privateConstructorUsedError;
  @JsonKey(name: "comments")
  String? get comments => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryConfirmationCopyWith<DeliveryConfirmation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryConfirmationCopyWith<$Res> {
  factory $DeliveryConfirmationCopyWith(DeliveryConfirmation value,
          $Res Function(DeliveryConfirmation) then) =
      _$DeliveryConfirmationCopyWithImpl<$Res, DeliveryConfirmation>;
  @useResult
  $Res call(
      {@JsonKey(name: "confirmation_id") int? confirmationId,
      @JsonKey(name: "order_id") int? orderId,
      @JsonKey(name: "confirmation_date") DateTime? dateConfirmed,
      @JsonKey(name: "recipient_name") String recipient,
      @JsonKey(name: "signature_image", includeFromJson: false) File? signature,
      @JsonKey(name: "order_image", includeFromJson: false) File? orderImage,
      @JsonKey(name: "comments") String? comments,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt});
}

/// @nodoc
class _$DeliveryConfirmationCopyWithImpl<$Res,
        $Val extends DeliveryConfirmation>
    implements $DeliveryConfirmationCopyWith<$Res> {
  _$DeliveryConfirmationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmationId = freezed,
    Object? orderId = freezed,
    Object? dateConfirmed = freezed,
    Object? recipient = null,
    Object? signature = freezed,
    Object? orderImage = freezed,
    Object? comments = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      confirmationId: freezed == confirmationId
          ? _value.confirmationId
          : confirmationId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateConfirmed: freezed == dateConfirmed
          ? _value.dateConfirmed
          : dateConfirmed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as File?,
      orderImage: freezed == orderImage
          ? _value.orderImage
          : orderImage // ignore: cast_nullable_to_non_nullable
              as File?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryConfirmationImplCopyWith<$Res>
    implements $DeliveryConfirmationCopyWith<$Res> {
  factory _$$DeliveryConfirmationImplCopyWith(_$DeliveryConfirmationImpl value,
          $Res Function(_$DeliveryConfirmationImpl) then) =
      __$$DeliveryConfirmationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "confirmation_id") int? confirmationId,
      @JsonKey(name: "order_id") int? orderId,
      @JsonKey(name: "confirmation_date") DateTime? dateConfirmed,
      @JsonKey(name: "recipient_name") String recipient,
      @JsonKey(name: "signature_image", includeFromJson: false) File? signature,
      @JsonKey(name: "order_image", includeFromJson: false) File? orderImage,
      @JsonKey(name: "comments") String? comments,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt});
}

/// @nodoc
class __$$DeliveryConfirmationImplCopyWithImpl<$Res>
    extends _$DeliveryConfirmationCopyWithImpl<$Res, _$DeliveryConfirmationImpl>
    implements _$$DeliveryConfirmationImplCopyWith<$Res> {
  __$$DeliveryConfirmationImplCopyWithImpl(_$DeliveryConfirmationImpl _value,
      $Res Function(_$DeliveryConfirmationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmationId = freezed,
    Object? orderId = freezed,
    Object? dateConfirmed = freezed,
    Object? recipient = null,
    Object? signature = freezed,
    Object? orderImage = freezed,
    Object? comments = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$DeliveryConfirmationImpl(
      confirmationId: freezed == confirmationId
          ? _value.confirmationId
          : confirmationId // ignore: cast_nullable_to_non_nullable
              as int?,
      orderId: freezed == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int?,
      dateConfirmed: freezed == dateConfirmed
          ? _value.dateConfirmed
          : dateConfirmed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as File?,
      orderImage: freezed == orderImage
          ? _value.orderImage
          : orderImage // ignore: cast_nullable_to_non_nullable
              as File?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryConfirmationImpl
    with DiagnosticableTreeMixin
    implements _DeliveryConfirmation {
  const _$DeliveryConfirmationImpl(
      {@JsonKey(name: "confirmation_id") this.confirmationId,
      @JsonKey(name: "order_id") this.orderId,
      @JsonKey(name: "confirmation_date") this.dateConfirmed,
      @JsonKey(name: "recipient_name") required this.recipient,
      @JsonKey(name: "signature_image", includeFromJson: false) this.signature,
      @JsonKey(name: "order_image", includeFromJson: false) this.orderImage,
      @JsonKey(name: "comments") this.comments,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});

  factory _$DeliveryConfirmationImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryConfirmationImplFromJson(json);

  @override
  @JsonKey(name: "confirmation_id")
  final int? confirmationId;
  @override
  @JsonKey(name: "order_id")
  final int? orderId;
  @override
  @JsonKey(name: "confirmation_date")
  final DateTime? dateConfirmed;
  @override
  @JsonKey(name: "recipient_name")
  final String recipient;
  @override
  @JsonKey(name: "signature_image", includeFromJson: false)
  final File? signature;
  @override
  @JsonKey(name: "order_image", includeFromJson: false)
  final File? orderImage;
  @override
  @JsonKey(name: "comments")
  final String? comments;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeliveryConfirmation(confirmationId: $confirmationId, orderId: $orderId, dateConfirmed: $dateConfirmed, recipient: $recipient, signature: $signature, orderImage: $orderImage, comments: $comments, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeliveryConfirmation'))
      ..add(DiagnosticsProperty('confirmationId', confirmationId))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('dateConfirmed', dateConfirmed))
      ..add(DiagnosticsProperty('recipient', recipient))
      ..add(DiagnosticsProperty('signature', signature))
      ..add(DiagnosticsProperty('orderImage', orderImage))
      ..add(DiagnosticsProperty('comments', comments))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('updatedAt', updatedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryConfirmationImpl &&
            (identical(other.confirmationId, confirmationId) ||
                other.confirmationId == confirmationId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.dateConfirmed, dateConfirmed) ||
                other.dateConfirmed == dateConfirmed) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.orderImage, orderImage) ||
                other.orderImage == orderImage) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      confirmationId,
      orderId,
      dateConfirmed,
      recipient,
      signature,
      orderImage,
      comments,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryConfirmationImplCopyWith<_$DeliveryConfirmationImpl>
      get copyWith =>
          __$$DeliveryConfirmationImplCopyWithImpl<_$DeliveryConfirmationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryConfirmationImplToJson(
      this,
    );
  }
}

abstract class _DeliveryConfirmation implements DeliveryConfirmation {
  const factory _DeliveryConfirmation(
          {@JsonKey(name: "confirmation_id") final int? confirmationId,
          @JsonKey(name: "order_id") final int? orderId,
          @JsonKey(name: "confirmation_date") final DateTime? dateConfirmed,
          @JsonKey(name: "recipient_name") required final String recipient,
          @JsonKey(name: "signature_image", includeFromJson: false)
          final File? signature,
          @JsonKey(name: "order_image", includeFromJson: false)
          final File? orderImage,
          @JsonKey(name: "comments") final String? comments,
          @JsonKey(name: "created_at") required final DateTime createdAt,
          @JsonKey(name: "updated_at") required final DateTime updatedAt}) =
      _$DeliveryConfirmationImpl;

  factory _DeliveryConfirmation.fromJson(Map<String, dynamic> json) =
      _$DeliveryConfirmationImpl.fromJson;

  @override
  @JsonKey(name: "confirmation_id")
  int? get confirmationId;
  @override
  @JsonKey(name: "order_id")
  int? get orderId;
  @override
  @JsonKey(name: "confirmation_date")
  DateTime? get dateConfirmed;
  @override
  @JsonKey(name: "recipient_name")
  String get recipient;
  @override
  @JsonKey(name: "signature_image", includeFromJson: false)
  File? get signature;
  @override
  @JsonKey(name: "order_image", includeFromJson: false)
  File? get orderImage;
  @override
  @JsonKey(name: "comments")
  String? get comments;
  @override
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryConfirmationImplCopyWith<_$DeliveryConfirmationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
