import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/bloc/verify_cubit.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/widgets/capture_id.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCustomer extends StatefulWidget {
  const VerifyCustomer({super.key, required this.order});
  final Order order;

  @override
  State<VerifyCustomer> createState() => _VerifyCustomerState();
}

class _VerifyCustomerState extends State<VerifyCustomer> {
  VerificationMeans _character = VerificationMeans.OTP;
  List<DropdownMenuItem<VerificationMeans>> get dropdownItems {
    List<DropdownMenuItem<VerificationMeans>> menuItems = [
      const DropdownMenuItem(value: VerificationMeans.OTP, child: Text("OTP")),
      const DropdownMenuItem(value: VerificationMeans.ID, child: Text("ID"))
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Verify By:"),
            const SizedBox(
              width: 16,
            ),
            DropdownButton<VerificationMeans>(
              value: _character,
              items: dropdownItems,
              onChanged: (value) {
                setState(() {
                  _character = value!;
                });
              },
            ),
          ],
        ),
        SizedBox(
          height: AppBar().preferredSize.height / 2,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOutSine,
          // switchOutCurve: Curves.easeInOutBack,
          child: _character == VerificationMeans.OTP
              ? ByOTP(id: widget.order.orderId)
              : ByID(
                  id: widget.order.orderId,
                ),
        )
      ],
    );
  }
}

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
                    // context.read<ProcessingCubit>().orderConfirmationUpdate(
                    //     OrderConfirmation(orderId: widget.id, otp: v),
                    //     StepContinue());
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
