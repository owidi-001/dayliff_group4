import 'dart:io';
import 'dart:ui' as ui;
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class CustomerSignature extends StatefulWidget {
  const CustomerSignature({super.key, required this.order});
  final Order order;

  @override
  State<CustomerSignature> createState() => _CustomerSignatureState();
}

class _CustomerSignatureState extends State<CustomerSignature> {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    _signaturePadKey.currentState!.clear();
  }

  // void _handleSaveButtonPressed() async {
  //   final data = await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
  //   final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  //   await showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //           child: Container(
  //             color: Colors.grey[300],
  //             child: Image.memory(bytes!.buffer.asUint8List()),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: SfSignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: Colors.white,
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 1.0,
                  maximumStrokeWidth: 4.0)),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            BlocBuilder<ProcessingCubit, ProcessingState>(
              builder: (context, state) {
                return ElevatedButton.icon(
                  icon: const Icon(
                    FontAwesomeIcons.cloudArrowUp,
                    size: 16,
                  ),
                  onPressed: state.status == ServiceStatus.submissionInProgress
                      ? null
                      : () async {
                          ui.Image image =
                              await _signaturePadKey.currentState!.toImage();
                          Uint8List? byteData = await imageToByte(image);
                          File? imageFile = await saveImage(byteData!);
                          if (imageFile != null) {
                            // Save to checkout
                            context
                                .read<CheckOutBloc>()
                                .add(SignatureChanged(file: imageFile));
                            // Submit
                            context
                                .read<ProcessingCubit>()
                                .orderConfirmationUpdate(
                                    OrderConfirmation(
                                        orderId: widget.order.orderId,
                                        signature: imageFile),
                                    StepContinue());
                          }
                        },
                  label: const Text('Upload'),
                );
              },
            ),
            Expanded(
              child: TextButton(
                onPressed: _handleClearButtonPressed,
                child: const Text('Clear'),
              ),
            ),
          ])
        ]);
  }
}
