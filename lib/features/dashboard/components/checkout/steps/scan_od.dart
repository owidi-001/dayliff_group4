import 'dart:io';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
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
            state.dnote.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 16, // Spacing between columns
                      mainAxisSpacing: 16, // Spacing between rows
                    ),
                    itemCount: state.dnote.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                      onLongPress: () {
                        showDialog(
                          context: context,
                          // showDragHandle: true,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              insetPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: AppBar().preferredSize.height),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    maxHeight:
                                        MediaQuery.sizeOf(context).width),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16, top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Remove image",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: const Icon(
                                                  FontAwesomeIcons.xmark))
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      height: 4,
                                      color: Colors.transparent,
                                    ),
                                    Expanded(
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Image.file(
                                              state.dnote[index],
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ButtonBar(
                                      alignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Theme.of(context)
                                                          .colorScheme
                                                          .error)),
                                          onPressed: () {
                                            context.read<CheckOutBloc>().add(
                                                RemoveCaptured(index: index));
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all()),
                        constraints:
                            const BoxConstraints(maxHeight: 150, maxWidth: 150),
                        child: Image.file(
                          state.dnote[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (state.dnote.isNotEmpty)
                  ElevatedButton.icon(
                    onPressed:
                        state.status == ServiceStatus.submissionInProgress
                            ? null
                            : () {
                                context
                                    .read<ProcessingCubit>()
                                    .orderConfirmationUpdate(
                                        OrderConfirmation(
                                            orderId: order.orderId,
                                            dnote: context
                                                .read<CheckOutBloc>()
                                                .state
                                                .dnote),
                                        StepContinue());
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
                            ScanOD(
                              image: File(image.path),
                            ),
                          );
                    }
                  },
                  icon: Icon(state.dnote.isEmpty
                      ? FontAwesomeIcons.camera
                      : FontAwesomeIcons.plus),
                  label: Text(state.dnote.isEmpty ? 'Capture' : "Add"),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
