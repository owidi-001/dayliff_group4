import 'dart:io';

import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ByID extends StatefulWidget {
  const ByID({super.key, required this.id});
  final int id;

  @override
  State<ByID> createState() => _ByIDState();
}

class _ByIDState extends State<ByID> {
  final _idNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return BlocBuilder<CheckOutBloc, CheckoutState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
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
              state.idPhoto != null
                  ? Center(
                      child: Image.file(
                      state.idPhoto!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ))
                  : Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
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
                            child: const Text('Take Photo of ID'),
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.grey),
                        height: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "OR",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.grey),
                        height: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                child: TextFormField(
                  controller: _idNumberController,
                  validator: (value) {
                    RegExp regex = RegExp(r'^\d{8}$');

                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter an id number';
                    } else if (!regex.hasMatch(value)) {
                      return 'Please enter a valid id number';
                    } else {
                      return null;
                    }
                  },
                  style: TextStyle(color: StaticColors.primary),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.email,
                      color: StaticColors.onPrimary.withOpacity(.6),
                    ),
                    labelText: "ID number",
                    hintText: "Eg. 00000000",
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: StaticColors.primary),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                          color: StaticColors
                              .primary), // Brighter color when focused
                    ),
                    focusColor: StaticColors.primary,
                  ),
                  onChanged: (value) {
                    context.read<CheckOutBloc>().add(
                        IDNumberChanged(idNumber: _idNumberController.text));
                  },
                  onSaved: (value) {
                    context.read<CheckOutBloc>().add(
                        IDNumberChanged(idNumber: _idNumberController.text));
                  },
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Check if either image and id is null
                  if (state.idNumber == null && state.idPhoto == null) {
                    showOverlayMessage(
                      AppMessage(
                          message: "Please verify receiver by either ID or OTP",
                          tone: MessageTone.error),
                    );
                  } else {
                    // Submit both
                    context.read<ProcessingCubit>().idValidation(
                        _idNumberController.text,
                        state.idPhoto,
                        widget.id,
                        StepContinue());
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
}
