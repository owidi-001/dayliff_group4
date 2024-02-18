import 'dart:io';

import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/verify_cubit.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
                ? ByOTP(id: widget.order.orderId!)
                : ByID(
                    id: widget.order.orderId!,
                  ))
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
                    context.read<ProcessingCubit>().orderConfirmationUpdate(
                        OrderConfirmation(orderId: widget.id, otp: v),
                        StepContinue());
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
                    // Submit OTP
                    context.read<ProcessingCubit>().orderConfirmationUpdate(
                        OrderConfirmation(
                            orderId: widget.id, otp: otpController.text),
                        StepContinue());
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

class ByID extends StatelessWidget {
  const ByID({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return BlocBuilder<CheckOutBloc, CheckoutState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Take a clear photo of the receivers ID",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            state.idPhoto != null
                ? Image.file(
                    state.idPhoto!,
                    fit: BoxFit.contain,
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                // TODO
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  // Add image captured to state
                  context.read<CheckOutBloc>().add(
                        IDProof(
                          image: File(image.path),
                        ),
                      );
                }
              },
              icon: const Icon(Icons.document_scanner),
              label: const Text('Capture'),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                state.idPhoto != null
                    ? ElevatedButton.icon(
                        onPressed: () {
                          if (state.otp == null && state.idPhoto == null) {
                            showOverlayMessage(
                              AppMessage(
                                  message:
                                      "Please verify receiver by either ID or OTP",
                                  tone: MessageTone.error),
                            );
                          } else {
                            context
                                .read<ProcessingCubit>()
                                .orderConfirmationUpdate(
                                    OrderConfirmation(
                                      orderId: id,
                                      receiverId: context
                                          .read<CheckOutBloc>()
                                          .state
                                          .idPhoto,
                                    ),
                                    StepContinue());
                          }
                        },
                        icon: const Icon(Icons.check),
                        label: const Text("Save & Continue"),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        );
      },
    );
  }
}
