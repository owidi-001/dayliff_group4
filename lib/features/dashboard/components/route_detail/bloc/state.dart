part of "bloc.dart";

class ProcessingState extends Equatable {
  final ServiceStatus status;

  const ProcessingState({this.status = ServiceStatus.initial});

  @override
  List<Object> get props => [];
}
