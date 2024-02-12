// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverUpdateImpl _$$DriverUpdateImplFromJson(Map<String, dynamic> json) =>
    _$DriverUpdateImpl(
      firstName: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone_number'] as String?,
      license: json['license_number'] as String?,
    );

Map<String, dynamic> _$$DriverUpdateImplToJson(_$DriverUpdateImpl instance) =>
    <String, dynamic>{
      'name': instance.firstName,
      'email': instance.email,
      'phone_number': instance.phone,
      'license_number': instance.license,
    };
