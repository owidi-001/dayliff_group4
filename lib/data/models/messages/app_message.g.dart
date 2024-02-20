// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppMessageImpl _$$AppMessageImplFromJson(Map<String, dynamic> json) =>
    _$AppMessageImpl(
      message: json['message'] as String,
      tone: $enumDecode(_$MessageToneEnumMap, json['tone']),
    );

Map<String, dynamic> _$$AppMessageImplToJson(_$AppMessageImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'tone': _$MessageToneEnumMap[instance.tone]!,
    };

const _$MessageToneEnumMap = {
  MessageTone.success: 'success',
  MessageTone.error: 'error',
  MessageTone.warning: 'warning',
  MessageTone.info: 'info',
  MessageTone.loading: 'loading',
};

_$CustomSmsImpl _$$CustomSmsImplFromJson(Map<String, dynamic> json) =>
    _$CustomSmsImpl(
      message: json['message'] as String,
      receipient: json['phone'] as String,
    );

Map<String, dynamic> _$$CustomSmsImplToJson(_$CustomSmsImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'phone': instance.receipient,
    };
