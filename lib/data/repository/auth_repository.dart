import 'dart:async';

import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/multiple_results/multiple_results.dart';
import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/data/service/service.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  AuthenticationRepository._();
  static AuthenticationRepository instance = AuthenticationRepository._();
  final _controller = StreamController<AuthenticationStatus>.broadcast();

  AuthenticationStatus _status = AuthenticationStatus.unknown;
  String? authToken;
  Driver? _user;
  Driver? get user => _user;

  Stream<AuthenticationStatus> get stream async* {
    yield _status;
    yield* _controller.stream.asBroadcastStream();
  }

  AuthenticationStatus get status => _status;

  Future<void> login(String authToken) async {
    this.authToken = authToken;
    await getUser();
    _status = AuthenticationStatus.authenticated;
    _controller.add(_status);
  }

  // HttpResult<Rider> updateUser(RiderUpdateData data) {
  //   final res = service<ProfileService>().updateProfile(data).then((result) {
  //     result.when(
  //       onError: (error) => {},
  //       onSuccess: (data) {
  //         _user = data.user;
  //         storeUserData(data.user!);
  //       },
  //     );
  //     return result;
  //   });
  //   return res;
  // }

  HttpResult<Driver> getUser() async {
    if (_user != null) {
      return MultipleResult.onSuccess(data: _user!);
    }
    final localUserData = await AppUtility().getUserData();
    if (localUserData != null) {
      _user = localUserData;
      return MultipleResult.onSuccess(data: localUserData);
    }
    final res = await service<ProfileService>().fetchProfile();
    res.when(
        onError: (error) {
          if (error.code == 401) {
            // Let the user login
            logout();
          }
        },
        onSuccess: (user) => _user = user);
    return res;
  }

  void logout() {
    _status = AuthenticationStatus.unauthenticated;
    _controller.add(_status);
    // Clear data
    // clearUserData();
  }
}
