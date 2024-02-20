import 'package:dayliff/data/service/service.dart';
import 'package:flutter/material.dart';

class MessageNotificationsRepository {
  MessageNotificationsRepository._();
  static MessageNotificationsRepository instance =
      MessageNotificationsRepository._();

  // Send text notifications
  void sendTextMessage(String to, String message, {int retries = 5}) async {
    if (retries == 0) {
      return;
    }
    final res = await service<TextMessageService>().sendMessage(to, message);
    res.when(onError: (error) {
      debugPrint(error.error);
      // Send retry
      sendTextMessage(to, message, retries: retries -= 1);
    }, onSuccess: (data) {
      // Do nothing
    });
  }
}
