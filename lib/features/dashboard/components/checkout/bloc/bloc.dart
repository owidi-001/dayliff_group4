import 'dart:io';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "events.dart";
part 'state.dart';

class CheckOutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  late OrderCheckoutService _orderCheckoutService;
  final OrderBloc _orderBloc;

  CheckOutBloc(this._orderBloc) : super(const CheckoutState()) {
    _orderCheckoutService = service<OrderCheckoutService>();

// Change step
    on<UpdateStep>((event, emit) => emit(state.copyWith(step: event.step)));
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
        state.copyWith(message: "Delivery completed successfully"),
      );
      // clear state
      emit(const CheckoutState());
    });
    on<StartCheckOutBloc>(
      (event, emit) async {
        // // TODO! Remove comments when endpoints are ready
        // emit(
        //   state.copyWith(
        //     status: ServiceStatus.loading,
        //   ),
        // );
        // // showLoading("Please wait");

        // final orders = await _orderCheckoutService.all();
        // orders.when(
        //   onError: (error) {
        //     // showError(error.error);
        //     emit(
        //       state.copyWith(
        //         status: ServiceStatus.loadingFailure,
        //       ),
        //     );
        //   },
        //   onSuccess: (data) {
        //     // Removes loader: Prevents infinite loading after routes are fetched
        //     // EasyLoading.dismiss();
        //     return emit(state.copyWith(
        //       status: ServiceStatus.loadingSuccess,
        //       pools: data,
        //     ));
        //   },
        // );
      },
    );

    // Add image to list
    on<SaveCapturedImage>((event, emit) {
      emit(state.copyWith(orderImages: [event.image, ...state.orderImages]));
    });

    on<ScanOD>((event, emit) => emit(state.copyWith(dnote: event.image)));
    on<IDProof>((event, emit) => emit(state.copyWith(idPhoto: event.image)));

    // Remove image
    on<RemoveCaptured>((event, emit) {
      final files = state.orderImages;
      files.removeAt(event.index);
      emit(state.copyWith(orderImages: files));
    });

    // Save/update otp
    on<OtpChanged>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });

    // Save/update comments
    on<CommentsChanged>((event, emit) {
      emit(state.copyWith(comment: event.comment));
    });

// Verify OTP
    on<VerifyOTP>((event, emit) async {
      // showLoading("Verifying OTP");

      emit(state.copyWith(otpVerified: true, otp: "1234"));

      // TODO! Uncomment when Checkout endpoints are ready
      // emit(state.copyWith(status: ServiceStatus.submissionInProgress));
      // final res = await _orderCheckoutService.verifyCheckoutCode(
      //     code: state.otp!, orderId: state.order!.orderId!);
      // res.when(onError: (error) {
      //   // showError(error.error);
      //   emit(state.copyWith(status: ServiceStatus.submissionFailure));
      // }, onSuccess: (data) {
      //   // showSuccess(data["message"]);
      //   emit(state.copyWith(
      //       status: ServiceStatus.submissionSuccess, otpVerified: true),);
      // });
    });

// Confirming delivery
    // on<ConfirmDelivery>((event, emit) {
    //   // Create new instance of Delivery Checkout
    //   if (state.comment?.isEmpty ??
    //       false || state.orderImages.isNotEmpty || !state.otpVerified) {
    //     // showError("Please ensure all fields are not empty!");
    //   } else {
    //     // Send data to backend
    //     _orderCheckoutService.confirmDelivery(
    //         deliveryConfirmation: DeliveryConfirmation(
    //             recipient: state.order!.customerName,
    //             orderId: state.order!.orderId!,
    //             orderImage: state.orderImages.first));
    //   }
    // });
  }
}
