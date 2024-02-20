import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:overlay_support/overlay_support.dart';

void showOverlayMessage(AppMessage message, {bool isLoading = false}) {
  showSimpleNotification(
    Text(message.message),
    background: getMessageTone(message.tone),
    trailing: _getTrailing(message.tone),
    // autoDismiss: !(message.tone == MessageTone.loading,)
  );
}

Color getMessageTone(MessageTone tone) {
  switch (tone) {
    case MessageTone.success:
      return Colors.green;
    case MessageTone.warning:
      return Colors.deepOrange;
    case MessageTone.error:
      return Colors.red;
    case MessageTone.loading:
      return const Color(0xff0082d6);
    default:
      return Colors.black;
  }
}

Widget _getTrailing(MessageTone tone) {
  switch (tone) {
    case MessageTone.success:
      return const Icon(FontAwesomeIcons.check);
    case MessageTone.warning:
      return const Icon(FontAwesomeIcons.triangleExclamation);
    case MessageTone.error:
      return const Icon(FontAwesomeIcons.exclamation);
    case MessageTone.loading:
      return const CircularProgressIndicator(
        color: Colors.white,
      );
    default:
      return const Icon(FontAwesomeIcons.info);
  }
}
