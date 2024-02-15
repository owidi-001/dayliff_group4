import 'package:dayliff/data/service/service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events.dart';
part 'state.dart';

class ProcessingBloc extends Bloc<ProcessingEvent, ProcessingState> {
  ProcessingBloc() : super(const ProcessingState()) {
    on<ProcessingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
