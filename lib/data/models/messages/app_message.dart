// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_message.freezed.dart';
part 'app_message.g.dart';

enum MessageTone { success, error, warning, info, loading }

@freezed
class AppMessage with _$AppMessage {
  factory AppMessage({
    required String message,
    required MessageTone tone,
  }) = _AppMessage;

  factory AppMessage.fromJson(Map<String, dynamic> json) =>
      _$AppMessageFromJson(json);
}

// CUstom messages
@freezed
class CustomSms with _$CustomSms {
  factory CustomSms({
    required String message,
    @JsonKey(name: "phone") required String receipient,
  }) = _CustomSms;

  factory CustomSms.fromJson(Map<String, dynamic> json) =>
      _$CustomSmsFromJson(json);
}
