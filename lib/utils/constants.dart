import 'package:flutter/material.dart';

const TIMEOUT = 30000;
// const BASE_URL = "https://dayliff-group-4-backend-production.up.railway.app/api/v1/"; // Node
const BASE_URL = "https://a877-196-43-220-1.ngrok-free.app/api/";
const USER_DATA_KEY = "USER_DATA";

class StaticColors {
  static Color primary = const Color(0xff0082d6);
  static Color onPrimary = const Color(0xffffffff);
  static Color dark = const Color.fromARGB(255, 86, 86, 86);
}

String? validatePassword(String? value) {
  if ((value?.length ?? 0) < 6) {
    return 'Password must be more than 5 characters';
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value ?? '')) {
    return 'Enter Valid Email';
  } else {
    return null;
  }
}

InputDecoration getInputDecoration(
    {required String hint, required bool darkMode, required Color errorColor}) {
  return InputDecoration(
    constraints: const BoxConstraints(maxWidth: 720, minWidth: 200),
    contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    fillColor: darkMode ? StaticColors.onPrimary : Colors.grey.shade400,
    hintText: hint,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: StaticColors.primary, width: 2.0)),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: errorColor),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: darkMode ? StaticColors.onPrimary : Colors.grey.shade400,
          width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}
