import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color getTripStatusColor(TripStatus status) {
  switch (status) {
    case TripStatus.Incomplete:
      return Colors.deepOrange;
    case TripStatus.Active:
      return Colors.blue;
    case TripStatus.Complete:
      return Colors.green;
    default:
      return Colors.blue;
  }
}

Color getStatusColor(OrderStatus status) {
  switch (status) {
    case OrderStatus.Cancelled:
      return Colors.red;
    case OrderStatus.Completed:
      return Colors.green;
    // case OrderStatus.PARTIAL:
    //   return Colors.black;
    case OrderStatus.Incomplete:
      return Colors.deepOrange;
    default:
      return Colors.blue;
  }
}

IconData getStatusIcon(OrderStatus status) {
  switch (status) {
    case OrderStatus.Cancelled:
      return Icons.error;
    case OrderStatus.Completed:
      return Icons.check;
    // case OrderStatus.PARTIAL:
    //   return Icons.incomplete_circle;
    case OrderStatus.Incomplete:
      return Icons.pending;
    default:
      return Icons.access_time;
  }
}

String formatDate(DateTime date) {
  return DateFormat('EEEE, MMMM d, y').format(date);
}
