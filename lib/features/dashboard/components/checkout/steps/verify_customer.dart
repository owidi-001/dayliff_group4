import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

enum SingingCharacter { OTP, ID }

class VerifyCustomer extends StatefulWidget {
  const VerifyCustomer({super.key, required this.order});
  final Order order;

  @override
  State<VerifyCustomer> createState() => _VerifyCustomerState();
}

class _VerifyCustomerState extends State<VerifyCustomer> {
  SingingCharacter _character = SingingCharacter.OTP;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('OTP'),
                leading: Radio(
                  value: SingingCharacter.OTP,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      _character = value!;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('ID'),
                leading: Radio(
                  value: SingingCharacter.ID,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      _character = value!;
                    });
                  },
                ),
              ),
            )
          ],
        ),
        _character == SingingCharacter.OTP ? const ByOTP() : const ByID()
      ],
    );
  }
}

class ByOTP extends StatelessWidget {
  const ByOTP({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Validate customer by OTP",
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
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Go to next
                context.read<CheckOutBloc>().add(StepContinue());
              },
              icon: const Icon(Icons.check),
              label: const Text("Verify"),
            ),
            // Expanded(
            //   child: TextButton(
            //     onPressed: () {
            //       context.read<CheckOutBloc>().add(StepCancelled());
            //     },
            //     child: const Text('Submit'),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

class ByID extends StatelessWidget {
  const ByID({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Validate customer by national ID",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 20),
        TextField(
          controller: idController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.edit_document),
              // suffix: const Icon(Icons.clear),
              contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              hintText: "ID number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Go to next
                context.read<CheckOutBloc>().add(StepContinue());
              },
              icon: const Icon(Icons.check),
              label: const Text("Verify"),
            ),
          ],
        ),
      ],
    );
  }
}
