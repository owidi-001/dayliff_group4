import 'dart:io';

import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class ODScanWidget extends StatelessWidget {
  const ODScanWidget({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return BlocBuilder<CheckOutBloc, CheckoutState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            state.dnote != null
                ? Image.file(
                    state.dnote!,
                    fit: BoxFit.contain,
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 16,
            ),
            state.dnote == null
                ? ElevatedButton.icon(
                    onPressed: () async {
                      final XFile? image = await picker.pickImage(
                          source: ImageSource.camera,
                          maxHeight: 1024,
                          maxWidth: 1024,
                          preferredCameraDevice: CameraDevice.rear,
                          imageQuality: 50);
                      if (image != null) {
                        // Add image captured to state
                        context.read<CheckOutBloc>().add(
                              ScanOD(
                                image: File(image.path),
                              ),
                            );
                      }
                    },
                    icon: const Icon(Icons.document_scanner),
                    label: const Text('Scan'),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              width: 16,
            ),
            state.dnote != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<ProcessingCubit>()
                              .orderConfirmationUpdate(
                                  OrderConfirmation(
                                      orderId: order.orderId,
                                      odScan: context
                                          .read<CheckOutBloc>()
                                          .state
                                          .dnote),
                                  StepContinue());
                        },
                        icon: const Icon(FontAwesomeIcons.cloudArrowUp),
                        label: const Text("Continue"),
                      ),
                      state.dnote != null
                          ? TextButton.icon(
                              onPressed: () async {
                                final XFile? image = await picker.pickImage(
                                    source: ImageSource.camera,
                                    maxHeight: 1024,
                                    maxWidth: 1024,
                                    preferredCameraDevice: CameraDevice.rear,
                                    imageQuality: 50);
                                if (image != null) {
                                  // Add image captured to state
                                  context.read<CheckOutBloc>().add(
                                        ScanOD(
                                          image: File(image.path),
                                        ),
                                      );
                                }
                              },
                              icon: const Icon(FontAwesomeIcons.cameraRotate),
                              label: const Text("re-scan"))
                          : const SizedBox.shrink()
                    ],
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }
}
