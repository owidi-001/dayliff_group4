// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trip_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartTripRequest _$StartTripRequestFromJson(Map<String, dynamic> json) {
  return _StartTripRequest.fromJson(json);
}

/// @nodoc
mixin _$StartTripRequest {
  @JsonKey(name: "trip_id")
  int get tripId => throw _privateConstructorUsedError;
  @JsonKey(name: "start_trip")
  LatLng_ get coordinates => throw _privateConstructorUsedError;
  TripStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: "start_trip_time")
  DateTime get startTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartTripRequestCopyWith<StartTripRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartTripRequestCopyWith<$Res> {
  factory $StartTripRequestCopyWith(
          StartTripRequest value, $Res Function(StartTripRequest) then) =
      _$StartTripRequestCopyWithImpl<$Res, StartTripRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "trip_id") int tripId,
      @JsonKey(name: "start_trip") LatLng_ coordinates,
      TripStatus status,
      @JsonKey(name: "start_trip_time") DateTime startTime});

  $LatLng_CopyWith<$Res> get coordinates;
}

/// @nodoc
class _$StartTripRequestCopyWithImpl<$Res, $Val extends StartTripRequest>
    implements $StartTripRequestCopyWith<$Res> {
  _$StartTripRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? coordinates = null,
    Object? status = null,
    Object? startTime = null,
  }) {
    return _then(_value.copyWith(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng_,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLng_CopyWith<$Res> get coordinates {
    return $LatLng_CopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartTripRequestImplCopyWith<$Res>
    implements $StartTripRequestCopyWith<$Res> {
  factory _$$StartTripRequestImplCopyWith(_$StartTripRequestImpl value,
          $Res Function(_$StartTripRequestImpl) then) =
      __$$StartTripRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "trip_id") int tripId,
      @JsonKey(name: "start_trip") LatLng_ coordinates,
      TripStatus status,
      @JsonKey(name: "start_trip_time") DateTime startTime});

  @override
  $LatLng_CopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$StartTripRequestImplCopyWithImpl<$Res>
    extends _$StartTripRequestCopyWithImpl<$Res, _$StartTripRequestImpl>
    implements _$$StartTripRequestImplCopyWith<$Res> {
  __$$StartTripRequestImplCopyWithImpl(_$StartTripRequestImpl _value,
      $Res Function(_$StartTripRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tripId = null,
    Object? coordinates = null,
    Object? status = null,
    Object? startTime = null,
  }) {
    return _then(_$StartTripRequestImpl(
      tripId: null == tripId
          ? _value.tripId
          : tripId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng_,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TripStatus,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartTripRequestImpl
    with DiagnosticableTreeMixin
    implements _StartTripRequest {
  const _$StartTripRequestImpl(
      {@JsonKey(name: "trip_id") required this.tripId,
      @JsonKey(name: "start_trip") required this.coordinates,
      required this.status,
      @JsonKey(name: "start_trip_time") required this.startTime});

  factory _$StartTripRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartTripRequestImplFromJson(json);

  @override
  @JsonKey(name: "trip_id")
  final int tripId;
  @override
  @JsonKey(name: "start_trip")
  final LatLng_ coordinates;
  @override
  final TripStatus status;
  @override
  @JsonKey(name: "start_trip_time")
  final DateTime startTime;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartTripRequest(tripId: $tripId, coordinates: $coordinates, status: $status, startTime: $startTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartTripRequest'))
      ..add(DiagnosticsProperty('tripId', tripId))
      ..add(DiagnosticsProperty('coordinates', coordinates))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('startTime', startTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartTripRequestImpl &&
            (identical(other.tripId, tripId) || other.tripId == tripId) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tripId, coordinates, status, startTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartTripRequestImplCopyWith<_$StartTripRequestImpl> get copyWith =>
      __$$StartTripRequestImplCopyWithImpl<_$StartTripRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartTripRequestImplToJson(
      this,
    );
  }
}

abstract class _StartTripRequest implements StartTripRequest {
  const factory _StartTripRequest(
      {@JsonKey(name: "trip_id") required final int tripId,
      @JsonKey(name: "start_trip") required final LatLng_ coordinates,
      required final TripStatus status,
      @JsonKey(name: "start_trip_time")
      required final DateTime startTime}) = _$StartTripRequestImpl;

  factory _StartTripRequest.fromJson(Map<String, dynamic> json) =
      _$StartTripRequestImpl.fromJson;

  @override
  @JsonKey(name: "trip_id")
  int get tripId;
  @override
  @JsonKey(name: "start_trip")
  LatLng_ get coordinates;
  @override
  TripStatus get status;
  @override
  @JsonKey(name: "start_trip_time")
  DateTime get startTime;
  @override
  @JsonKey(ignore: true)
  _$$StartTripRequestImplCopyWith<_$StartTripRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LatLng_ _$LatLng_FromJson(Map<String, dynamic> json) {
  return _LatLng_.fromJson(json);
}

/// @nodoc
mixin _$LatLng_ {
  @JsonKey(name: "lat")
  double get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "long")
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLng_CopyWith<LatLng_> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLng_CopyWith<$Res> {
  factory $LatLng_CopyWith(LatLng_ value, $Res Function(LatLng_) then) =
      _$LatLng_CopyWithImpl<$Res, LatLng_>;
  @useResult
  $Res call(
      {@JsonKey(name: "lat") double latitude,
      @JsonKey(name: "long") double longitude});
}

/// @nodoc
class _$LatLng_CopyWithImpl<$Res, $Val extends LatLng_>
    implements $LatLng_CopyWith<$Res> {
  _$LatLng_CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LatLng_ImplCopyWith<$Res> implements $LatLng_CopyWith<$Res> {
  factory _$$LatLng_ImplCopyWith(
          _$LatLng_Impl value, $Res Function(_$LatLng_Impl) then) =
      __$$LatLng_ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "lat") double latitude,
      @JsonKey(name: "long") double longitude});
}

/// @nodoc
class __$$LatLng_ImplCopyWithImpl<$Res>
    extends _$LatLng_CopyWithImpl<$Res, _$LatLng_Impl>
    implements _$$LatLng_ImplCopyWith<$Res> {
  __$$LatLng_ImplCopyWithImpl(
      _$LatLng_Impl _value, $Res Function(_$LatLng_Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LatLng_Impl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LatLng_Impl with DiagnosticableTreeMixin implements _LatLng_ {
  const _$LatLng_Impl(
      {@JsonKey(name: "lat") required this.latitude,
      @JsonKey(name: "long") required this.longitude});

  factory _$LatLng_Impl.fromJson(Map<String, dynamic> json) =>
      _$$LatLng_ImplFromJson(json);

  @override
  @JsonKey(name: "lat")
  final double latitude;
  @override
  @JsonKey(name: "long")
  final double longitude;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LatLng_(latitude: $latitude, longitude: $longitude)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LatLng_'))
      ..add(DiagnosticsProperty('latitude', latitude))
      ..add(DiagnosticsProperty('longitude', longitude));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LatLng_Impl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LatLng_ImplCopyWith<_$LatLng_Impl> get copyWith =>
      __$$LatLng_ImplCopyWithImpl<_$LatLng_Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LatLng_ImplToJson(
      this,
    );
  }
}

abstract class _LatLng_ implements LatLng_ {
  const factory _LatLng_(
      {@JsonKey(name: "lat") required final double latitude,
      @JsonKey(name: "long") required final double longitude}) = _$LatLng_Impl;

  factory _LatLng_.fromJson(Map<String, dynamic> json) = _$LatLng_Impl.fromJson;

  @override
  @JsonKey(name: "lat")
  double get latitude;
  @override
  @JsonKey(name: "long")
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$LatLng_ImplCopyWith<_$LatLng_Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

StartTripResponse _$StartTripResponseFromJson(Map<String, dynamic> json) {
  return _StartTripResponse.fromJson(json);
}

/// @nodoc
mixin _$StartTripResponse {
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartTripResponseCopyWith<StartTripResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartTripResponseCopyWith<$Res> {
  factory $StartTripResponseCopyWith(
          StartTripResponse value, $Res Function(StartTripResponse) then) =
      _$StartTripResponseCopyWithImpl<$Res, StartTripResponse>;
  @useResult
  $Res call({@JsonKey(name: "message") String message});
}

/// @nodoc
class _$StartTripResponseCopyWithImpl<$Res, $Val extends StartTripResponse>
    implements $StartTripResponseCopyWith<$Res> {
  _$StartTripResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartTripResponseImplCopyWith<$Res>
    implements $StartTripResponseCopyWith<$Res> {
  factory _$$StartTripResponseImplCopyWith(_$StartTripResponseImpl value,
          $Res Function(_$StartTripResponseImpl) then) =
      __$$StartTripResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "message") String message});
}

/// @nodoc
class __$$StartTripResponseImplCopyWithImpl<$Res>
    extends _$StartTripResponseCopyWithImpl<$Res, _$StartTripResponseImpl>
    implements _$$StartTripResponseImplCopyWith<$Res> {
  __$$StartTripResponseImplCopyWithImpl(_$StartTripResponseImpl _value,
      $Res Function(_$StartTripResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StartTripResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartTripResponseImpl
    with DiagnosticableTreeMixin
    implements _StartTripResponse {
  const _$StartTripResponseImpl(
      {@JsonKey(name: "message") required this.message});

  factory _$StartTripResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartTripResponseImplFromJson(json);

  @override
  @JsonKey(name: "message")
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartTripResponse(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartTripResponse'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartTripResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartTripResponseImplCopyWith<_$StartTripResponseImpl> get copyWith =>
      __$$StartTripResponseImplCopyWithImpl<_$StartTripResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartTripResponseImplToJson(
      this,
    );
  }
}

abstract class _StartTripResponse implements StartTripResponse {
  const factory _StartTripResponse(
          {@JsonKey(name: "message") required final String message}) =
      _$StartTripResponseImpl;

  factory _StartTripResponse.fromJson(Map<String, dynamic> json) =
      _$StartTripResponseImpl.fromJson;

  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$StartTripResponseImplCopyWith<_$StartTripResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StartNavigationRequest _$StartNavigationRequestFromJson(
    Map<String, dynamic> json) {
  return _StartNavigationRequest.fromJson(json);
}

/// @nodoc
mixin _$StartNavigationRequest {
  @JsonKey(name: "order_id")
  int get orderId => throw _privateConstructorUsedError;
  LatLng_ get coordinates => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartNavigationRequestCopyWith<StartNavigationRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartNavigationRequestCopyWith<$Res> {
  factory $StartNavigationRequestCopyWith(StartNavigationRequest value,
          $Res Function(StartNavigationRequest) then) =
      _$StartNavigationRequestCopyWithImpl<$Res, StartNavigationRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "order_id") int orderId,
      LatLng_ coordinates,
      OrderStatus status});

  $LatLng_CopyWith<$Res> get coordinates;
}

/// @nodoc
class _$StartNavigationRequestCopyWithImpl<$Res,
        $Val extends StartNavigationRequest>
    implements $StartNavigationRequestCopyWith<$Res> {
  _$StartNavigationRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? coordinates = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng_,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLng_CopyWith<$Res> get coordinates {
    return $LatLng_CopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartNavigationRequestImplCopyWith<$Res>
    implements $StartNavigationRequestCopyWith<$Res> {
  factory _$$StartNavigationRequestImplCopyWith(
          _$StartNavigationRequestImpl value,
          $Res Function(_$StartNavigationRequestImpl) then) =
      __$$StartNavigationRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "order_id") int orderId,
      LatLng_ coordinates,
      OrderStatus status});

  @override
  $LatLng_CopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$StartNavigationRequestImplCopyWithImpl<$Res>
    extends _$StartNavigationRequestCopyWithImpl<$Res,
        _$StartNavigationRequestImpl>
    implements _$$StartNavigationRequestImplCopyWith<$Res> {
  __$$StartNavigationRequestImplCopyWithImpl(
      _$StartNavigationRequestImpl _value,
      $Res Function(_$StartNavigationRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? coordinates = null,
    Object? status = null,
  }) {
    return _then(_$StartNavigationRequestImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng_,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartNavigationRequestImpl
    with DiagnosticableTreeMixin
    implements _StartNavigationRequest {
  const _$StartNavigationRequestImpl(
      {@JsonKey(name: "order_id") required this.orderId,
      required this.coordinates,
      required this.status});

  factory _$StartNavigationRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartNavigationRequestImplFromJson(json);

  @override
  @JsonKey(name: "order_id")
  final int orderId;
  @override
  final LatLng_ coordinates;
  @override
  final OrderStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartNavigationRequest(orderId: $orderId, coordinates: $coordinates, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartNavigationRequest'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('coordinates', coordinates))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartNavigationRequestImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, coordinates, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartNavigationRequestImplCopyWith<_$StartNavigationRequestImpl>
      get copyWith => __$$StartNavigationRequestImplCopyWithImpl<
          _$StartNavigationRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartNavigationRequestImplToJson(
      this,
    );
  }
}

abstract class _StartNavigationRequest implements StartNavigationRequest {
  const factory _StartNavigationRequest(
      {@JsonKey(name: "order_id") required final int orderId,
      required final LatLng_ coordinates,
      required final OrderStatus status}) = _$StartNavigationRequestImpl;

  factory _StartNavigationRequest.fromJson(Map<String, dynamic> json) =
      _$StartNavigationRequestImpl.fromJson;

  @override
  @JsonKey(name: "order_id")
  int get orderId;
  @override
  LatLng_ get coordinates;
  @override
  OrderStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$StartNavigationRequestImplCopyWith<_$StartNavigationRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StartNavigationResponse _$StartNavigationResponseFromJson(
    Map<String, dynamic> json) {
  return _StartNavigationResponse.fromJson(json);
}

/// @nodoc
mixin _$StartNavigationResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartNavigationResponseCopyWith<StartNavigationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartNavigationResponseCopyWith<$Res> {
  factory $StartNavigationResponseCopyWith(StartNavigationResponse value,
          $Res Function(StartNavigationResponse) then) =
      _$StartNavigationResponseCopyWithImpl<$Res, StartNavigationResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$StartNavigationResponseCopyWithImpl<$Res,
        $Val extends StartNavigationResponse>
    implements $StartNavigationResponseCopyWith<$Res> {
  _$StartNavigationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartNavigationResponseImplCopyWith<$Res>
    implements $StartNavigationResponseCopyWith<$Res> {
  factory _$$StartNavigationResponseImplCopyWith(
          _$StartNavigationResponseImpl value,
          $Res Function(_$StartNavigationResponseImpl) then) =
      __$$StartNavigationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StartNavigationResponseImplCopyWithImpl<$Res>
    extends _$StartNavigationResponseCopyWithImpl<$Res,
        _$StartNavigationResponseImpl>
    implements _$$StartNavigationResponseImplCopyWith<$Res> {
  __$$StartNavigationResponseImplCopyWithImpl(
      _$StartNavigationResponseImpl _value,
      $Res Function(_$StartNavigationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StartNavigationResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartNavigationResponseImpl
    with DiagnosticableTreeMixin
    implements _StartNavigationResponse {
  const _$StartNavigationResponseImpl({required this.message});

  factory _$StartNavigationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartNavigationResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartNavigationResponse(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartNavigationResponse'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartNavigationResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartNavigationResponseImplCopyWith<_$StartNavigationResponseImpl>
      get copyWith => __$$StartNavigationResponseImplCopyWithImpl<
          _$StartNavigationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartNavigationResponseImplToJson(
      this,
    );
  }
}

abstract class _StartNavigationResponse implements StartNavigationResponse {
  const factory _StartNavigationResponse({required final String message}) =
      _$StartNavigationResponseImpl;

  factory _StartNavigationResponse.fromJson(Map<String, dynamic> json) =
      _$StartNavigationResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$StartNavigationResponseImplCopyWith<_$StartNavigationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StartHandoverRequest _$StartHandoverRequestFromJson(Map<String, dynamic> json) {
  return _StartHandoverRequest.fromJson(json);
}

/// @nodoc
mixin _$StartHandoverRequest {
  @JsonKey(name: "")
  int get orderId => throw _privateConstructorUsedError;
  LatLng_ get coordinates => throw _privateConstructorUsedError;
  OrderStatus get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartHandoverRequestCopyWith<StartHandoverRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartHandoverRequestCopyWith<$Res> {
  factory $StartHandoverRequestCopyWith(StartHandoverRequest value,
          $Res Function(StartHandoverRequest) then) =
      _$StartHandoverRequestCopyWithImpl<$Res, StartHandoverRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "") int orderId,
      LatLng_ coordinates,
      OrderStatus status});

  $LatLng_CopyWith<$Res> get coordinates;
}

/// @nodoc
class _$StartHandoverRequestCopyWithImpl<$Res,
        $Val extends StartHandoverRequest>
    implements $StartHandoverRequestCopyWith<$Res> {
  _$StartHandoverRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? coordinates = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng_,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LatLng_CopyWith<$Res> get coordinates {
    return $LatLng_CopyWith<$Res>(_value.coordinates, (value) {
      return _then(_value.copyWith(coordinates: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StartHandoverRequestImplCopyWith<$Res>
    implements $StartHandoverRequestCopyWith<$Res> {
  factory _$$StartHandoverRequestImplCopyWith(_$StartHandoverRequestImpl value,
          $Res Function(_$StartHandoverRequestImpl) then) =
      __$$StartHandoverRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "") int orderId,
      LatLng_ coordinates,
      OrderStatus status});

  @override
  $LatLng_CopyWith<$Res> get coordinates;
}

/// @nodoc
class __$$StartHandoverRequestImplCopyWithImpl<$Res>
    extends _$StartHandoverRequestCopyWithImpl<$Res, _$StartHandoverRequestImpl>
    implements _$$StartHandoverRequestImplCopyWith<$Res> {
  __$$StartHandoverRequestImplCopyWithImpl(_$StartHandoverRequestImpl _value,
      $Res Function(_$StartHandoverRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? coordinates = null,
    Object? status = null,
  }) {
    return _then(_$StartHandoverRequestImpl(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as int,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng_,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartHandoverRequestImpl
    with DiagnosticableTreeMixin
    implements _StartHandoverRequest {
  const _$StartHandoverRequestImpl(
      {@JsonKey(name: "") required this.orderId,
      required this.coordinates,
      required this.status});

  factory _$StartHandoverRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartHandoverRequestImplFromJson(json);

  @override
  @JsonKey(name: "")
  final int orderId;
  @override
  final LatLng_ coordinates;
  @override
  final OrderStatus status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartHandoverRequest(orderId: $orderId, coordinates: $coordinates, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartHandoverRequest'))
      ..add(DiagnosticsProperty('orderId', orderId))
      ..add(DiagnosticsProperty('coordinates', coordinates))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartHandoverRequestImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, coordinates, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartHandoverRequestImplCopyWith<_$StartHandoverRequestImpl>
      get copyWith =>
          __$$StartHandoverRequestImplCopyWithImpl<_$StartHandoverRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartHandoverRequestImplToJson(
      this,
    );
  }
}

abstract class _StartHandoverRequest implements StartHandoverRequest {
  const factory _StartHandoverRequest(
      {@JsonKey(name: "") required final int orderId,
      required final LatLng_ coordinates,
      required final OrderStatus status}) = _$StartHandoverRequestImpl;

  factory _StartHandoverRequest.fromJson(Map<String, dynamic> json) =
      _$StartHandoverRequestImpl.fromJson;

  @override
  @JsonKey(name: "")
  int get orderId;
  @override
  LatLng_ get coordinates;
  @override
  OrderStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$StartHandoverRequestImplCopyWith<_$StartHandoverRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StartHandoverResponse _$StartHandoverResponseFromJson(
    Map<String, dynamic> json) {
  return _StartHandoverResponse.fromJson(json);
}

/// @nodoc
mixin _$StartHandoverResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartHandoverResponseCopyWith<StartHandoverResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartHandoverResponseCopyWith<$Res> {
  factory $StartHandoverResponseCopyWith(StartHandoverResponse value,
          $Res Function(StartHandoverResponse) then) =
      _$StartHandoverResponseCopyWithImpl<$Res, StartHandoverResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$StartHandoverResponseCopyWithImpl<$Res,
        $Val extends StartHandoverResponse>
    implements $StartHandoverResponseCopyWith<$Res> {
  _$StartHandoverResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartHandoverResponseImplCopyWith<$Res>
    implements $StartHandoverResponseCopyWith<$Res> {
  factory _$$StartHandoverResponseImplCopyWith(
          _$StartHandoverResponseImpl value,
          $Res Function(_$StartHandoverResponseImpl) then) =
      __$$StartHandoverResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$StartHandoverResponseImplCopyWithImpl<$Res>
    extends _$StartHandoverResponseCopyWithImpl<$Res,
        _$StartHandoverResponseImpl>
    implements _$$StartHandoverResponseImplCopyWith<$Res> {
  __$$StartHandoverResponseImplCopyWithImpl(_$StartHandoverResponseImpl _value,
      $Res Function(_$StartHandoverResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$StartHandoverResponseImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartHandoverResponseImpl
    with DiagnosticableTreeMixin
    implements _StartHandoverResponse {
  const _$StartHandoverResponseImpl({required this.message});

  factory _$StartHandoverResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartHandoverResponseImplFromJson(json);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StartHandoverResponse(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StartHandoverResponse'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartHandoverResponseImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartHandoverResponseImplCopyWith<_$StartHandoverResponseImpl>
      get copyWith => __$$StartHandoverResponseImplCopyWithImpl<
          _$StartHandoverResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartHandoverResponseImplToJson(
      this,
    );
  }
}

abstract class _StartHandoverResponse implements StartHandoverResponse {
  const factory _StartHandoverResponse({required final String message}) =
      _$StartHandoverResponseImpl;

  factory _StartHandoverResponse.fromJson(Map<String, dynamic> json) =
      _$StartHandoverResponseImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$StartHandoverResponseImplCopyWith<_$StartHandoverResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
