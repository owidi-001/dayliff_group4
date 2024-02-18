import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

void showOverlayMessage(AppMessage message) {
  showSimpleNotification(Text(message.message),
      background: getMessageTone(message.tone));
}

Color getMessageTone(MessageTone tone) {
  switch (tone) {
    case MessageTone.success:
      return Colors.green;
    case MessageTone.warning:
      return Colors.deepOrange;
    case MessageTone.error:
      return Colors.red;
    default:
      return Colors.black;
  }
}
