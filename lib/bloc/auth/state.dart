part of 'bloc.dart';

class AuthState extends Equatable {
  final String? message;
  final ServiceStatus status;
  final bool loginSuccess;
  final User? user;
  final String? token;

  const AuthState(
      {this.message,
      this.status = ServiceStatus.initial,
      this.loginSuccess = false,
      this.user,
      this.token});

  AuthState copyWith(
      {String? message,
      ServiceStatus? status,
      bool? loginSuccess,
      User? user,
      String? token}) {
    return AuthState(
        message: message,
        status: status ?? this.status,
        loginSuccess: loginSuccess ?? this.loginSuccess,
        user: user ?? this.user,
        token: token ?? this.token);
  }

  @override
  List<Object?> get props => [message, status, loginSuccess, user, token];
}
