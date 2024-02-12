// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  bool operator ==(Object other) {
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
