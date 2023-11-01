import 'package:bloc/bloc.dart';

class DashboardControllerBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardControllerBloc() : super(DashboardState(0)) {
    on<DashboardEvent>(
        (event, emit) => emit(state.copyWith(position: event.position)));
  }
}

class DashboardState {
  final int position;

  DashboardState(this.position);
  DashboardState copyWith({
    int? position,
  }) {
    return DashboardState(
      position ?? this.position,
    );
  }
}

class DashboardEvent {
  final int position;

  DashboardEvent(this.position);
}