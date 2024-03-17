import 'dart:io';

import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "events.dart";
part 'state.dart';

class CheckOutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckOutBloc() : super(const CheckoutState()) {
    // Change step
    on<UpdateStep>((event, emit) {
      emit(
        state.copyWith(step: event.step),
      );
    });

    on<StepContinue>(
      (event, emit) => emit(
        state.copyWith(step: state.step + 1),
      ),
    );
    on<StepCancelled>(
      (event, emit) => emit(
        state.copyWith(step: state.step - 1),
      ),
    );

    on<StepComplete>((event, emit) {
      emit(
        state.copyWith(
            message: AppMessage(
                message: "Delivery completed successfully",
                tone: MessageTone.success),
            checkoutSuccess: true),
      );

      // clear state
      emit(const CheckoutState());
    });

    // Save/update id
    on<IDProof>((event, emit) {
      emit(state.copyWith(idPhoto: event.image));
    });

    // Save/update otp
    on<OtpChanged>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });

    // Add image to list
    on<SaveCapturedImage>((event, emit) {
      emit(state.copyWith(orderImages: [event.image, ...state.orderImages]));
    });

    on<ScanOD>((event, emit) =>
        emit(state.copyWith(dnote: [event.image, ...state.dnote])));

    // on<IDProof>((event, emit) => emit(state.copyWith(idPhoto: event.image)));

    on<SignatureChanged>(
        (event, emit) => emit(state.copyWith(signature: event.file)));

    // Save/update comments
    on<CommentsChanged>((event, emit) {
      emit(state.copyWith(comment: event.comment));
    });

    // delete pod images
    on<RemovePODImage>((event, emit) {
      final images = state.orderImages;
      images.removeAt(event.index);
      
      emit(state.copyWith(orderImages: images));
      
    });
  }
}
