import 'dart:io';

import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
            Container(
              margin: const EdgeInsets.only(top: 16),
              width: MediaQuery.sizeOf(context).width,
              constraints: const BoxConstraints(minHeight: 100),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                color: Theme.of(context).colorScheme.primary.withOpacity(.1),
              ),
              child: state.idPhoto != null
                  ? Image.file(
                      state.idPhoto!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () async {
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.camera,
                              maxHeight: 512,
                              maxWidth: 512,
                              preferredCameraDevice: CameraDevice.rear,
                              imageQuality: 50);
                          if (image != null) {
                            // Add image captured to state
                            context.read<CheckOutBloc>().add(
                                  IDProof(
                                    image: File(image.path),
                                  ),
                                );
                          }
                        },
                        child: Icon(
                          FontAwesomeIcons.camera,
                          size: 48,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
            ),
            const SizedBox(
              height: 8,
            ),
            state.idPhoto != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed:
                            state.status == ServiceStatus.submissionInProgress
                                ? null
                                : () {
                                    if (state.otp == null &&
                                        state.idPhoto == null) {
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
                        icon: const Icon(
                          FontAwesomeIcons.cloudArrowUp,
                          size: 16,
                        ),
                        label: const Text("Continue"),
                      ),
                      TextButton.icon(
                          onPressed: () async {
                            final XFile? image = await picker.pickImage(
                                source: ImageSource.camera,
                                maxHeight: 512,
                                maxWidth: 512,
                                preferredCameraDevice: CameraDevice.rear,
                                imageQuality: 50);
                            if (image != null) {
                              // Add image captured to state
                              context.read<CheckOutBloc>().add(
                                    IDProof(
                                      image: File(image.path),
                                    ),
                                  );
                            }
                          },
                          icon: const Icon(FontAwesomeIcons.cameraRotate),
                          label: const Text("Re-capture"))
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
