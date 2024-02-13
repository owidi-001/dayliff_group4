part of 'bloc.dart';

class SettingsState extends Equatable {
  final String? profilePicture;
  final ServiceStatus status;
  final String? message;

  const SettingsState(
      {this.message, this.profilePicture, this.status = ServiceStatus.initial});

  SettingsState copyWith(
     {String? profilePicture,
    ServiceStatus? status,
    String? message,}
  ) {
    return SettingsState(
        message: message,
        status: status ?? this.status,
        profilePicture: profilePicture ?? this.profilePicture);
  }

  @override
  List<dynamic> get props => [profilePicture, status, message];
}
