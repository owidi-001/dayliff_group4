import 'package:dayliff/features/dashboard/components/notifications/models/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = List.generate(
      8,
      (index) => dummyNotification,
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final formattedDate = _formatDate(notification.date);

          // Check if the previous notification has a different date
          final bool showDate = index == 0 ||
              _isDifferentDate(
                  notification.date, notifications[index - 1].date);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (showDate)
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  color: Colors.grey[300],
                  child: Text(
                    formattedDate,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ListTile(
                title: Text(notification.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.content),

                    const SizedBox(
                        height: 4), // Add some spacing between content and date
                    Text(
                      _formatDate(notification.date),
                      style: const TextStyle(
                        color: Colors.grey, // Customize the date text color
                        fontSize: 12, // Customize the date text size
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  // Add your onTap logic here
                },
                // Customize the ListTile based on isRead status
                tileColor: notification.isRead ? Colors.grey[200] : null,
              ),
            ],
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Format the date as per your requirements
    return '${date.day}/${date.month}/${date.year}';
  }

  bool _isDifferentDate(DateTime date1, DateTime date2) {
    // Check if two dates are different (for grouping by date)
    return date1.day != date2.day ||
        date1.month != date2.month ||
        date1.year != date2.year;
  }
}
