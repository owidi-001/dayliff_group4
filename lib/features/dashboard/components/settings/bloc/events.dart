part of "bloc.dart";

class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

// Start settings data
class InitSettings extends SettingsEvent {}

// Change profile pic
class ChangeProfilePic extends SettingsEvent {}

// Changes password
class ChangePassword extends SettingsEvent {
  final String currentPassword;
  final String newPassword;

  const ChangePassword(
      {required this.currentPassword, required this.newPassword});
}
