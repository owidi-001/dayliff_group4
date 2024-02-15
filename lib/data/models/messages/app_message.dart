import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_message.freezed.dart';
part 'app_message.g.dart';

enum MessageTone { success, error, warning, info }

@freezed
class AppMessage with _$AppMessage {
  factory AppMessage({
    required String message,
    required MessageTone tone,
  }) = _AppMessage;

  factory AppMessage.fromJson(Map<String, dynamic> json) =>
      _$AppMessageFromJson(json);
}
