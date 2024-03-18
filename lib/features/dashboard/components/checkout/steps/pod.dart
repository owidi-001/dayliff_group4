import 'dart:io';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class PODWidget extends StatefulWidget {
  const PODWidget({super.key, required this.order});
  final Order order;

  @override
  State<PODWidget> createState() => _PODWidgetState();
}

class _PODWidgetState extends State<PODWidget> {
  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();
    return BlocBuilder<CheckOutBloc, CheckoutState>(
      builder: (context, state) {
        // print(object)
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            state.orderImages.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount:
                        context.read<CheckOutBloc>().state.orderImages.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(border: Border.all()),
                            constraints: const BoxConstraints(
                                maxHeight: 150, maxWidth: 150),
                            child: Image.file(
                              context
                                  .read<CheckOutBloc>()
                                  .state
                                  .orderImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          child: IconButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    title: const Text('Delete Confirmation'),
                                    content: const Text(
                                        'Are you sure you want to delete this POD image?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.read<CheckOutBloc>().add(
                                              RemovePODImage(index: index));
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Delete',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error)),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (state.orderImages.isNotEmpty)
                  ElevatedButton.icon(
                    onPressed:
                        state.status == ServiceStatus.submissionInProgress
                            ? null
                            : () {
                                context
                                    .read<ProcessingCubit>()
                                    .orderConfirmationUpdate(
                                      OrderConfirmation(
                                          orderId: widget.order.orderId,
                                          orderImages: context
                                              .read<CheckOutBloc>()
                                              .state
                                              .orderImages),
                                      StepContinue(),
                                    );
                              },
                    icon: const Icon(FontAwesomeIcons.cloudArrowUp),
                    label: const Text("Continue"),
                  ),
                ElevatedButton.icon(
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
                  label: Text(state.orderImages.isEmpty ? 'Capture' : "Add"),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
