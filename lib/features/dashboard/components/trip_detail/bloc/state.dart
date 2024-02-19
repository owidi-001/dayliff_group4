part of "bloc.dart";

class ProcessingState extends Equatable {
  final ServiceStatus status;
  final Trip? selectedTrip;
  final Order? selectedOrder;
  final AppMessage? message;
  final OrderConfirmation? confirmation;
  // events notifier
  final bool startTripSuccess;
  final bool completeTripSuccess;
  final bool serviceStarted;

  const ProcessingState(
      {this.status = ServiceStatus.initial,
      this.selectedTrip,
      this.selectedOrder,
      this.message,
      this.confirmation,
      this.startTripSuccess = false,
      this.completeTripSuccess = false,
      this.serviceStarted = false});

  ProcessingState copyWith(
      {AppMessage? message,
      ServiceStatus? status,
      Trip? selectedTrip,
      Order? selectedOrder,
      OrderConfirmation? confirmation,
      bool? startTripSuccess,
      bool? completeTripSuccess,
      bool? serviceStarted}) {
    return ProcessingState(
      message: message,
      startTripSuccess: startTripSuccess ?? false,
      serviceStarted: serviceStarted ?? false,
      completeTripSuccess: completeTripSuccess ?? false,
      status: status ?? this.status,
      selectedOrder: selectedOrder ?? this.selectedOrder,
      selectedTrip: selectedTrip ?? this.selectedTrip,
      confirmation: confirmation ?? this.confirmation,
    );
  }

  @override
  List<dynamic> get props => [
        message,
        status,
        selectedOrder,
        selectedTrip,
        startTripSuccess,
        serviceStarted,
        completeTripSuccess,
        confirmation
      ];
}
