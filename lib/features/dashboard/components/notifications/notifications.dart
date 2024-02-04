import 'package:dayliff/features/dashboard/components/notifications/models/notifications.dart';
import 'package:dayliff/features/dashboard/components/notifications/widgets/notification_tile.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: StaticColors.primary,
          foregroundColor: StaticColors.onPrimary,
          title: const Text('Notifications'),
        ),
        SliverList.builder(
          itemCount: 5,
          itemBuilder: (context, index) => AnimateInEffect(
              keepAlive: true,
              intervalStart: index / 5,
              child: NotificationTile(
                notification: dummyNotification,
              )),
        )
      ],
    ));
  }
}
