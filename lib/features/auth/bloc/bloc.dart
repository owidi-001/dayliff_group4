import 'package:dayliff/data/models/auth/login.dart';
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
          ),
        );
        // todo! emit message
        // showLoading("Authenticating...");
        

        final res = await _authService
            .login(LoginData(email: event.email, password: event.password));
        res.when(
          onError: (error) {
            // showError(error.error);
            emit(
              state.copyWith(
                status: ServiceStatus.submissionFailure,
              ),
            );
          },
          onSuccess: (data) {
            // showSuccess("Welcome ${data.user.name}");
            add(LocalLogin(data: data));
            // // Save user data to repository
            // print("Login data saved: ${data.toJson()}");
            // // Update state
            // emit(state.copyWith(
            //     status: ServiceStatus.loadingSuccess,
            //     loginSuccess: true,
            //     user: data.user,
            //     token: data.token));
            // // Save to repository
            // AuthenticationRepository.instance.login(data);
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
      // emit(state.copyWith(
      //   status: ServiceStatus.initial,
      //   loginSuccess: false,
      //   user: null,
      //   token: null,
      //   resetFlag: true,
      // ));
      // Save to repository
      AuthenticationRepository.instance.logout();
    });
  }
}
