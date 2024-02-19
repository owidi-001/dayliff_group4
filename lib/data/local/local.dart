import 'dart:convert';
import 'dart:math';

import 'package:dayliff/data/models/auth/login.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android_intent_plus/android_intent.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

import 'package:url_launcher/url_launcher.dart';

class AppUtility {
// Launch maps navigation intent
  static void realTimeNavigation(LatLng destination) {
    final intent = AndroidIntent(
        action: 'action_view',
        data:
            'google.navigation:q=${destination.latitude},${destination.longitude}',
        package: 'com.google.android.apps.maps');
    intent.launch();
  }

  static String formattingAmount(double amount) {
    // Format the double to a human-readable string with commas
    String formattedAmount = amount.toStringAsFixed(2);
    final parts = formattedAmount.split('.');
    final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    parts[0] =
        parts[0].replaceAllMapped(regex, (Match match) => '${match[1]},');

    return parts.join('.');
  }

  static String randomString(int length) {
    final random = Random();
    const characters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return String.fromCharCodes(Iterable.generate(length,
        (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  }

  // Create custom marker icon
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);

    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);

    ui.FrameInfo fi = await codec.getNextFrame();

    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> uploadImage({ImageSource? source}) async {
    var pickedImage =
        await _imagePicker.pickImage(source: source ?? ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    }
    return null;
  }

  // Greetings
  static String greetingMessage() {
    var hour = DateTime.now().hour;

    if (hour <= 12) {
      return 'Good morning';
    } else if ((hour > 12) && (hour <= 16)) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  // Format the double to a human-readable string with commas
  String formatAmount(double amount) {
    String formattedAmount = amount.toStringAsFixed(2);
    final parts = formattedAmount.split('.');
    final RegExp regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    parts[0] =
        parts[0].replaceAllMapped(regex, (Match match) => '${match[1]},');

    return parts.join('.');
  }

  // Capitalize text
  static String capitalize(String text) {
    return "${text[0].toUpperCase()}${text.substring(1)}";
  }

// Launch caller
  static Future<void> makeCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  // Format date
  static List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  // Format date to readable string
  static String formatDate(DateTime dateTime) {
    String month = months[dateTime.month - 1];
    String date = "${dateTime.day}-$month-${dateTime.year}";
    return date;
  }

  // Shared prefs
  Future<void> storeUserData(LoginResponse res) async {
    await SharedPreferences.getInstance().then(
      (value) => value.setString(USER_DATA_KEY, jsonEncode(res.toJson())),
    );
  }

  ///Gets user data from local storage
  Future<LoginResponse?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(USER_DATA_KEY);
    if (data != null) {
      return LoginResponse.fromJson(jsonDecode(data));
    }
    return null;
  }

  void clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
