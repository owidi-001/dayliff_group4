import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';
import 'package:path_provider/path_provider.dart'; // Import this package

Color getTripStatusColor(TripStatus status) {
  switch (status) {
    case TripStatus.INCOMPLETE:
      return const Color.fromRGBO(255, 87, 34, 1);
    case TripStatus.ACTIVE:
      return Colors.blue;
    case TripStatus.COMPLETED:
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
    case OrderStatus.SCHEDULED:
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
    case OrderStatus.SCHEDULED:
      return Icons.pending;
    default:
      return Icons.access_time;
  }
}

int orderStatusPriority(OrderStatus status) {
  switch (status) {
    case OrderStatus.ACTIVE:
      return 1;
    case OrderStatus.SCHEDULED || OrderStatus.INCOMPLETE || OrderStatus.PENDING:
      return 2;
    case OrderStatus.COMPLETED:
      return 3;
    case OrderStatus.CANCELLED:
      return 4;
  }
}

String formatDate(DateTime date) {
  return DateFormat('EEEE, MMMM d, y').format(date);
}

// Function to convert ui.Image to bytes
Future<Uint8List?> imageToByte(ui.Image image) async {
  try {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      return byteData.buffer.asUint8List();
    }
    return null;
  } catch (e) {
    debugPrint("Error converting image to bytes: $e");
    return null;
  }
}

// Function to save bytes to file
Future<File?> saveImage(Uint8List bytes) async {
  try {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File imageFile = File('${directory.path}/signature.png');
    await imageFile.writeAsBytes(bytes);
    return imageFile;
  } catch (e) {
    debugPrint("Error saving image: $e");
    return null;
  }
}
