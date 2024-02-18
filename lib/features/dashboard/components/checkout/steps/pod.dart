import 'dart:io';

import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/bloc/bloc.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
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
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: state.orderImages.length,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(right: 16),
                        constraints:
                            const BoxConstraints(maxHeight: 150, maxWidth: 150),
                        child: Image.file(
                          state.orderImages[index],
                          fit: BoxFit.contain,
                        ),
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
                ElevatedButton.icon(
                  onPressed: () async {
                    // TODO
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                      // Add image captured to state
                      context.read<CheckOutBloc>().add(
                            SaveCapturedImage(
                              image: File(image.path),
                            ),
                          );
                    }
                  },
                  icon: Icon(state.orderImages.isEmpty
                      ? Icons.document_scanner
                      : FontAwesomeIcons.plus),
                  label: Text(
                      state.orderImages.isEmpty ? 'Capture' : "Add another"),
                ),
              ],
            ),
            Row(
              children: [
                state.orderImages.isNotEmpty
                    ? ElevatedButton.icon(
                        onPressed: () {
                          if (state.orderImages.isEmpty) {
                            showOverlayMessage(AppMessage(
                                message:
                                    "Please capture one or more order images",
                                tone: MessageTone.warning));
                          } else {
                            context
                                .read<ProcessingCubit>()
                                .orderConfirmationUpdate(
                                    OrderConfirmation(
                                        orderId: order.orderId!,
                                        orderImages: context
                                            .read<CheckOutBloc>()
                                            .state
                                            .orderImages),
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
