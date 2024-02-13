// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'driver.freezed.dart';
part 'driver.g.dart';

@freezed
class DriverUpdate with _$DriverUpdate {
  const factory DriverUpdate({
    @JsonKey(name: "name") String? firstName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone_number") String? phone,
    @JsonKey(name: "license_number") String? license,
  }) = _DriverUpdate;

  factory DriverUpdate.fromJson(Map<String, Object?> json) =>
      _$DriverUpdateFromJson(json);
}
