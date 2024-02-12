import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color getTripStatusColor(TripStatus status) {
  switch (status) {
    case TripStatus.INCOMPLETE:
      return Colors.red;
    case TripStatus.ACTIVE:
      return Colors.blue;
    case TripStatus.COMPLETE:
      return Colors.green;
    default:
      return Colors.blue;
  }
}

Color getStatusColor(OrderStatus status) {
  switch (status) {
    case OrderStatus.CANCELLED:
      return Colors.red;
    case OrderStatus.COMPLETED:
      return Colors.green;
    // case OrderStatus.PARTIAL:
    //   return Colors.black;
    case OrderStatus.PENDING:
      return Colors.deepOrange;
    default:
      return Colors.blue;
  }
}

IconData getStatusIcon(OrderStatus status) {
  switch (status) {
    case OrderStatus.CANCELLED:
      return Icons.error;
    case OrderStatus.COMPLETED:
      return Icons.check;
    // case OrderStatus.PARTIAL:
    //   return Icons.incomplete_circle;
    case OrderStatus.PENDING:
      return Icons.pending;
    default:
      return Icons.access_time;
  }
}

String formatDate(DateTime date) {
  return DateFormat('EEEE, MMMM d, y').format(date);
}
