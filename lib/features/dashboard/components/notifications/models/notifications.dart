import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications.freezed.dart';
part 'notifications.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String title,
    required String content,
    required DateTime date,
    required bool isRead,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}

final dummyNotification = NotificationModel(
  title: 'Test title',
  content: 'This is the content of notification .',
  date: DateTime.now(),
  isRead: false,
);
