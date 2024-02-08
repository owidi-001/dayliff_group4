import 'dart:io';

import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ScanOD extends StatelessWidget {
  const ScanOD({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return Column(
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
          children: [
            Expanded(
              child: ElevatedButton.icon(
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
                icon: const Icon(Icons.document_scanner),
                label: const Text('Scan'),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: BlocBuilder<CheckOutBloc, CheckoutState>(
                builder: (context, state) {
                  if (state.orderImages.isNotEmpty) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        // Go to next
                        context.read<CheckOutBloc>().add(StepContinue());
                      },
                      icon: const Icon(Icons.check),
                      label: const Text("Submit"),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
