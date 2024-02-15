part of "bloc.dart";

class ProcessingState extends Equatable {
  final ServiceStatus status;
  final Trip? selectedTrip;
  final Order? selectedOrder;
  final AppMessage? message;
  final OrderConfirmation? confirmation;

  const ProcessingState(
      {this.status = ServiceStatus.initial,
      this.selectedTrip,
      this.selectedOrder,
      this.message,
      this.confirmation});

  ProcessingState copyWith(
      {AppMessage? message,
      ServiceStatus? status,
      Trip? selectedTrip,
      Order? selectedOrder,
      OrderConfirmation? confirmation}) {
    return ProcessingState(
      message: message ?? this.message,
      status: status ?? this.status,
      selectedOrder: selectedOrder ?? this.selectedOrder,
      selectedTrip: selectedTrip ?? this.selectedTrip,
      confirmation: confirmation ?? this.confirmation,
    );
  }

  @override
  List<dynamic> get props =>
      [message, status, selectedOrder, selectedTrip, confirmation];
}
