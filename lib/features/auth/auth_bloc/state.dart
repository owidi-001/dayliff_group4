part of 'bloc.dart';

class AuthState extends Equatable {
  final AppMessage? message;
  final ServiceStatus status;
  final bool loginSuccess;
  final User? user;
  final String? token;
  // final bool? resetFlag;

  const AuthState({
    this.message,
    this.status = ServiceStatus.initial,
    this.loginSuccess = false,
    this.user,
    this.token,
    // this.resetFlag = false
  });

  AuthState copyWith({
    AppMessage? message,
    ServiceStatus? status,
    bool? loginSuccess,
    User? user,
    String? token,
    // bool resetFlag = false
  }) {
    return AuthState(
        message: message,
        status: status ?? this.status,
        loginSuccess: loginSuccess ?? this.loginSuccess,
        user: user ?? this.user,
        token: token ?? this.token

        // user: resetFlag ? null : user ?? this.user,
        // token: resetFlag ? null : token ?? this.token
        );
  }

  @override
  List<Object?> get props => [message, status, loginSuccess, user, token];
}
