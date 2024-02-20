import 'package:dayliff/data/models/auth/login.dart';
import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "events.dart";
part 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthService _authService;
  AuthBloc() : super(const AuthState()) {
    _authService = service<AuthService>();

    on<LoginEvent>(
      (event, emit) async {
        emit(
          state.copyWith(
              status: ServiceStatus.submissionInProgress,
              message: AppMessage(
                  message: "Authenticating driver...",
                  tone: MessageTone.loading)),
        );

        final res = await _authService
            .login(LoginData(email: event.email, password: event.password));
        res.when(
          onError: (error) {
            emit(
              state.copyWith(
                  status: ServiceStatus.submissionFailure,
                  message: AppMessage(
                      message: error.error, tone: MessageTone.error)),
            );
          },
          onSuccess: (data) {
            emit(state.copyWith(
                message: AppMessage(
                    message: "Welcome ${data.user.name}",
                    tone: MessageTone.success)));
            add(LocalLogin(data: data));
          },
        );
      },
    );

    on<LocalLogin>((event, emit) {
      emit(state.copyWith(
          status: ServiceStatus.loadingSuccess,
          loginSuccess: true,
          user: event.data.user,
          token: event.data.token));
      // Save to repository
      AuthenticationRepository.instance.login(event.data);
    });

    on<LogoutEvent>((event, emit) {
      // Save to repository
      AuthenticationRepository.instance.logout();
    });

    on<UpdateProfile>((event, emit) async {
      emit(
        state.copyWith(
            message: AppMessage(
                message: "Updating profile", tone: MessageTone.loading),
            status: ServiceStatus.submissionInProgress),
      );
      final res = await _authService.updateProfile(event.data);
      res.when(onError: (error) {
        emit(
          state.copyWith(
              message:
                  AppMessage(message: error.error, tone: MessageTone.error)),
        );
      }, onSuccess: (data) {
        final updatedUserData = state.user!.copyWith(
            email: event.data.email,
            phoneNumber: event.data.phoneNumber,
            name: event.data.name);
        // Update profile data
        emit(state.copyWith(
            message: AppMessage(message: data, tone: MessageTone.success),
            user: updatedUserData));
        // Update local storage
      });
    });
  }
}
