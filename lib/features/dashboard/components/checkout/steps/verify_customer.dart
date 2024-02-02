import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCustomer extends StatelessWidget {
  const VerifyCustomer({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
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
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Theme.of(context).colorScheme.onPrimary),
                animationDuration: const Duration(milliseconds: 300),
                // backgroundColor: Colors.blue.shade50,
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                // errorAnimationController: errorController,
                controller: otpController,
                onCompleted: (v) {
                  print("Completed");
                },

                onChanged: (value) {
                  context.read<CheckOutBloc>().add(OtpChanged(otp: value));
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");

                  return true;
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () =>
              context.read<CheckOutBloc>().add(const VerifyOTP(code: "1234")),
          child: const Text('Verify OTP'),
        ),
      ],
    );
  }
}
