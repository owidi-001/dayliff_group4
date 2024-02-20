part of "bloc.dart";

class ProcessingState extends Equatable {
  final ServiceStatus status;
  final AppMessage? message;
  final OrderConfirmation? confirmation;
  // events notifier
  final bool startTripSuccess;
  final bool completeTripSuccess;
  final bool startNavigationSuccess;
  final bool serviceStarted;

  const ProcessingState(
      {this.status = ServiceStatus.initial,
      this.message,
      this.confirmation,
      this.startTripSuccess = false,
      this.completeTripSuccess = false,
      this.startNavigationSuccess = false,
      this.serviceStarted = false});

  ProcessingState copyWith(
      {AppMessage? message,
      ServiceStatus? status,
      OrderConfirmation? confirmation,
      bool? startTripSuccess,
      bool? completeTripSuccess,
      bool? startNavigationSuccess,
      bool? serviceStarted}) {
    return ProcessingState(
      message: message,
      startTripSuccess: startTripSuccess ?? false,
      startNavigationSuccess: startNavigationSuccess ?? false,
      serviceStarted: serviceStarted ?? false,
      completeTripSuccess: completeTripSuccess ?? false,
      status: status ?? this.status,
      confirmation: confirmation ?? this.confirmation,
    );
  }

  @override
  List<dynamic> get props => [
        message,
        status,
        startTripSuccess,
        startNavigationSuccess,
        serviceStarted,
        completeTripSuccess,
        confirmation
      ];
}
