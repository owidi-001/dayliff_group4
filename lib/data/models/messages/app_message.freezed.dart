// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppMessage _$AppMessageFromJson(Map<String, dynamic> json) {
  return _AppMessage.fromJson(json);
}

/// @nodoc
mixin _$AppMessage {
  String get message => throw _privateConstructorUsedError;
  MessageTone get tone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppMessageCopyWith<AppMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppMessageCopyWith<$Res> {
  factory $AppMessageCopyWith(
          AppMessage value, $Res Function(AppMessage) then) =
      _$AppMessageCopyWithImpl<$Res, AppMessage>;
  @useResult
  $Res call({String message, MessageTone tone});
}

/// @nodoc
class _$AppMessageCopyWithImpl<$Res, $Val extends AppMessage>
    implements $AppMessageCopyWith<$Res> {
  _$AppMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tone = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as MessageTone,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppMessageImplCopyWith<$Res>
    implements $AppMessageCopyWith<$Res> {
  factory _$$AppMessageImplCopyWith(
          _$AppMessageImpl value, $Res Function(_$AppMessageImpl) then) =
      __$$AppMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, MessageTone tone});
}

/// @nodoc
class __$$AppMessageImplCopyWithImpl<$Res>
    extends _$AppMessageCopyWithImpl<$Res, _$AppMessageImpl>
    implements _$$AppMessageImplCopyWith<$Res> {
  __$$AppMessageImplCopyWithImpl(
      _$AppMessageImpl _value, $Res Function(_$AppMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? tone = null,
  }) {
    return _then(_$AppMessageImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tone: null == tone
          ? _value.tone
          : tone // ignore: cast_nullable_to_non_nullable
              as MessageTone,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppMessageImpl implements _AppMessage {
  _$AppMessageImpl({required this.message, required this.tone});

  factory _$AppMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppMessageImplFromJson(json);

  @override
  final String message;
  @override
  final MessageTone tone;

  @override
  String toString() {
    return 'AppMessage(message: $message, tone: $tone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppMessageImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tone, tone) || other.tone == tone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, tone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppMessageImplCopyWith<_$AppMessageImpl> get copyWith =>
      __$$AppMessageImplCopyWithImpl<_$AppMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppMessageImplToJson(
      this,
    );
  }
}

abstract class _AppMessage implements AppMessage {
  factory _AppMessage(
      {required final String message,
      required final MessageTone tone}) = _$AppMessageImpl;

  factory _AppMessage.fromJson(Map<String, dynamic> json) =
      _$AppMessageImpl.fromJson;

  @override
  String get message;
  @override
  MessageTone get tone;
  @override
  @JsonKey(ignore: true)
  _$$AppMessageImplCopyWith<_$AppMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomSms _$CustomSmsFromJson(Map<String, dynamic> json) {
  return _CustomSms.fromJson(json);
}

/// @nodoc
mixin _$CustomSms {
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "phone")
  String get receipient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomSmsCopyWith<CustomSms> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomSmsCopyWith<$Res> {
  factory $CustomSmsCopyWith(CustomSms value, $Res Function(CustomSms) then) =
      _$CustomSmsCopyWithImpl<$Res, CustomSms>;
  @useResult
  $Res call({String message, @JsonKey(name: "phone") String receipient});
}

/// @nodoc
class _$CustomSmsCopyWithImpl<$Res, $Val extends CustomSms>
    implements $CustomSmsCopyWith<$Res> {
  _$CustomSmsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? receipient = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      receipient: null == receipient
          ? _value.receipient
          : receipient // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomSmsImplCopyWith<$Res>
    implements $CustomSmsCopyWith<$Res> {
  factory _$$CustomSmsImplCopyWith(
          _$CustomSmsImpl value, $Res Function(_$CustomSmsImpl) then) =
      __$$CustomSmsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, @JsonKey(name: "phone") String receipient});
}

/// @nodoc
class __$$CustomSmsImplCopyWithImpl<$Res>
    extends _$CustomSmsCopyWithImpl<$Res, _$CustomSmsImpl>
    implements _$$CustomSmsImplCopyWith<$Res> {
  __$$CustomSmsImplCopyWithImpl(
      _$CustomSmsImpl _value, $Res Function(_$CustomSmsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? receipient = null,
  }) {
    return _then(_$CustomSmsImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      receipient: null == receipient
          ? _value.receipient
          : receipient // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomSmsImpl implements _CustomSms {
  _$CustomSmsImpl(
      {required this.message,
      @JsonKey(name: "phone") required this.receipient});

  factory _$CustomSmsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomSmsImplFromJson(json);

  @override
  final String message;
  @override
  @JsonKey(name: "phone")
  final String receipient;

  @override
  String toString() {
    return 'CustomSms(message: $message, receipient: $receipient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomSmsImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.receipient, receipient) ||
                other.receipient == receipient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, receipient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomSmsImplCopyWith<_$CustomSmsImpl> get copyWith =>
      __$$CustomSmsImplCopyWithImpl<_$CustomSmsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomSmsImplToJson(
      this,
    );
  }
}

abstract class _CustomSms implements CustomSms {
  factory _CustomSms(
          {required final String message,
          @JsonKey(name: "phone") required final String receipient}) =
      _$CustomSmsImpl;

  factory _CustomSms.fromJson(Map<String, dynamic> json) =
      _$CustomSmsImpl.fromJson;

  @override
  String get message;
  @override
  @JsonKey(name: "phone")
  String get receipient;
  @override
  @JsonKey(ignore: true)
  _$$CustomSmsImplCopyWith<_$CustomSmsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
