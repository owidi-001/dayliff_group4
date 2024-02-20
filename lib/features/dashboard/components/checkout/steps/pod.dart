import 'dart:io';

import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PODWidget extends StatelessWidget {
  const PODWidget({super.key, required this.order});
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
            BlocBuilder<CheckOutBloc, CheckoutState>(
              builder: (context, state) {
                if (state.orderImages.isNotEmpty) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 16, // Spacing between columns
                      mainAxisSpacing: 16, // Spacing between rows
                    ),
                    itemCount: state.orderImages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(border: Border.all()),
                      constraints:
                          const BoxConstraints(maxHeight: 150, maxWidth: 150),
                      child: Image.file(
                        state.orderImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                state.orderImages.length < 5
                    ? ElevatedButton.icon(
                        onPressed: () async {
                          final XFile? image = await picker.pickImage(
                              source: ImageSource.camera,
                              maxHeight: 1024,
                              maxWidth: 1024,
                              preferredCameraDevice: CameraDevice.rear,
                              imageQuality: 50);
                          if (image != null) {
                            context.read<CheckOutBloc>().add(
                                  SaveCapturedImage(
                                    image: File(image.path),
                                  ),
                                );
                          }
                        },
                        icon: Icon(state.orderImages.isEmpty
                            ? FontAwesomeIcons.camera
                            : FontAwesomeIcons.plus),
                        label:
                            Text(state.orderImages.isEmpty ? 'Capture' : "Add"),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            Row(
              children: [
                state.orderImages.isNotEmpty && state.orderImages.length == 5
                    ? ElevatedButton.icon(
                        onPressed: () {
                          context
                              .read<ProcessingCubit>()
                              .orderConfirmationUpdate(
                                  OrderConfirmation(
                                      orderId: order.orderId,
                                      orderImages: context
                                          .read<CheckOutBloc>()
                                          .state
                                          .orderImages),
                                  StepContinue());
                        },
                        icon: const Icon(FontAwesomeIcons.cloudArrowUp),
                        label: const Text("Continue"),
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
