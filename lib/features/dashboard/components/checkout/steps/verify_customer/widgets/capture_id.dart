import 'dart:io';

import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
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
            const SizedBox(
              height: 16,
            ),
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
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: Theme.of(context).colorScheme.primary),
                color: Theme.of(context).colorScheme.primary.withOpacity(.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: state.idPhoto != null
                    ? Stack(
                        children: [
                          Image.file(
                            state.idPhoto!,
                            fit: BoxFit.cover,
                            height: 120,
                            width: double.infinity,
                          )
                        ],
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
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        );
      },
    );
  }
}
