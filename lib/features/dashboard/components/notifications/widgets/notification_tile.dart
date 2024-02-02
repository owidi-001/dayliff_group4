import 'package:dayliff/features/dashboard/components/notifications/models/notifications.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          notification.title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          notification.content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Text(
          _formatDate(notification.date),
          style: const TextStyle(
            color: Colors.grey, // Customize the date text color
            fontSize: 12, // Customize the date text size
          ),
        ),
      ),
    );
  }
}

String _formatDate(DateTime date) {
  // Format the date as per your requirements
  return '${date.day}/${date.month}/${date.year}';
}
