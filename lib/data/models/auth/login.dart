// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login.freezed.dart';
part 'login.g.dart';

@freezed
class LoginData with _$LoginData {
  factory LoginData({
    @JsonKey(name: "email") required String email,
    required String password,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
class AuthToken with _$AuthToken {
  factory AuthToken({
    @JsonKey(name: "token") required String accessToken,
    @JsonKey(name: "message") String? message,
  }) = _AuthToken;

  factory AuthToken.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenFromJson(json);
}

@freezed
class LoginResponse with _$LoginResponse {
  factory LoginResponse({
    required String token,
    required User user,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    @JsonKey(name: "phone_number") required String phoneNumber,
    required String email,
    required String status,
    String? role,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
