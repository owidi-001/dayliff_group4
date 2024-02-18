import 'dart:io';

import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                ? SizedBox(
                    height: 150,
                    child: Image.file(
                      state.dnote!,
                      fit: BoxFit.contain,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                // TODO
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
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
            ),
            const SizedBox(
              width: 16,
            ),
            state.dnote != null
                ? ElevatedButton.icon(
                    onPressed: () {
                      context.read<ProcessingCubit>().orderConfirmationUpdate(
                          OrderConfirmation(
                              orderId: order.orderId!,
                              odScan: context.read<CheckOutBloc>().state.dnote),
                          StepContinue());
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Save & Continue"),
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }
}
