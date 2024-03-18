import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ByOTP extends StatefulWidget {
  const ByOTP({super.key, required this.id});
  final int id;

  @override
  State<ByOTP> createState() => _ByOTPState();
}

class _ByOTPState extends State<ByOTP> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Form(
      key: _otpFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            "Enter receiver's OTP",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      activeColor: StaticColors.primary,
                      activeFillColor: StaticColors.primary.withOpacity(.2),
                      selectedFillColor: StaticColors.primary.withOpacity(.2),
                      selectedColor: StaticColors.primary,
                      fieldWidth: 40,
                      inactiveColor: Colors.grey.shade400,
                      inactiveFillColor:
                          Theme.of(context).colorScheme.onPrimary),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: otpController,
                  onCompleted: (v) {
                    if (_otpFormKey.currentState!.validate()) {
                      // Submit OTP
                      context
                          .read<ProcessingCubit>()
                          .otpValidation(v, widget.id, StepContinue());
                    } else {
                      showOverlayMessage(AppMessage(
                          message: "Fill in the otp", tone: MessageTone.error));
                    }
                  },

                  onChanged: (value) {
                    context.read<CheckOutBloc>().add(OtpChanged(otp: value));
                  },
                  validator: (value) {
                    if (value!.length < 3) {
                      return "OTP too short";
                    } else {
                      return null;
                    }
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
            ],
          ),
          Flexible(
              child: Text(
            "The One Time Password was sent ot the receiver of this package. Request the receiver to provide the OTP code for verifycation",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: StaticColors.dark),
          )),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  if (_otpFormKey.currentState!.validate()) {
                    context
                        .read<CheckOutBloc>()
                        .add(OtpChanged(otp: otpController.text));
                    // Submit OTP
                    context.read<ProcessingCubit>().otpValidation(
                        otpController.text, widget.id, StepContinue());
                  } else {
                    showOverlayMessage(AppMessage(
                        message: "Fill in the otp", tone: MessageTone.error));
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text("Verify"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
