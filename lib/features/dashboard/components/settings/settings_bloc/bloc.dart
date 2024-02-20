import 'dart:io';

import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/settings/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'events.dart';
part 'state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  late AuthService _authService;
  late AuthenticationRepository _repository;
  late PickerRepository _pickerRepository;

  SettingsBloc() : super(const SettingsState()) {
    _authService = service<AuthService>();
    _repository = AuthenticationRepository.instance;
    _pickerRepository = PickerRepository();
    _pickerRepository = PickerRepository();
    // start settings event handler
    on<InitSettings>((event, emit) async {
      // Get profile picture
      final profilePicture = await _repository.getProfilePicture();
      emit(state.copyWith(profilePicture: profilePicture));
    });

    // Change profile picture
    on<ChangeProfilePic>((event, emit) async {
      // Pick profile picture
      final XFile? imageFile = await _pickerRepository.pickPhoto();
      if (imageFile != null) {
        // Save profile picture to local storage
        final result =
            await _repository.saveProfilePicture(File(imageFile.path));
        // Update profile picture in state
        emit(state.copyWith(profilePicture: result));
      }
    });

    // Update password
    on<ChangePassword>((event, emit) async {
      emit(state.copyWith(
          message: "Please wait", status: ServiceStatus.submissionInProgress));
      final res = await _authService.changePassword(
          event.currentPassword, event.newPassword);

      res.when(onError: (error) {
        emit(state.copyWith(
            message: error.error, status: ServiceStatus.submissionFailure));
      }, onSuccess: (data) {
        emit(state.copyWith(
            message: data, status: ServiceStatus.submissionSuccess));
        // Logout user
        _repository.logout();
        // Show success message and prompt to log in with new password
        emit(const SettingsState());
      });
    });
  }
}
