import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/auth/login.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository._();
  static AuthenticationRepository instance = AuthenticationRepository._();
  final _controller = StreamController<AuthenticationStatus>.broadcast();

  AuthenticationStatus _status = AuthenticationStatus.unknown;
  String? authToken;
  User? _user;
  User? get user => _user;

  Stream<AuthenticationStatus> get stream async* {
    yield _status;
    yield* _controller.stream.asBroadcastStream();
  }

  AuthenticationStatus get status => _status;

  Future<void> login(LoginResponse loginResponse) async {
    authToken = loginResponse.token;
    _user = loginResponse.user;
    _status = AuthenticationStatus.authenticated;
    _controller.add(_status);
  }

  static const String _profilePictureKey = 'profile_picture';

  Future<String?> saveProfilePicture(File imageFile) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String base64Image = base64Encode(await imageFile.readAsBytes());
      await prefs.setString(_profilePictureKey, base64Image);
      return base64Image;
    } catch (e) {
      // Handle error
      debugPrint('Error saving profile picture: $e');
    }
    return null;
  }

  Future<String?> getProfilePicture() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(_profilePictureKey);
    } catch (e) {
      // Handle error
      debugPrint('Error retrieving profile picture: $e');
      return null;
    }
  }

  void logout() async {
    _status = AuthenticationStatus.unauthenticated;
    _controller.add(_status);
    // Clear data
    await AppUtility().clearUserData();
  }
}
