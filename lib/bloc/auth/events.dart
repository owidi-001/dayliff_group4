part of "bloc.dart";

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class LocalLogin extends AuthEvent {
  final LoginResponse data;

  LocalLogin({required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [data];
}

class LogoutEvent extends AuthEvent {}
