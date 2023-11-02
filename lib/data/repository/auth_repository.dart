import 'dart:async';

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

  void logout() {
    _status = AuthenticationStatus.unauthenticated;
    _controller.add(_status);
    // Clear data
    AppUtility().clearUserData();
  }
}
