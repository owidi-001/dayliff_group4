import 'dart:ui' as ui;
import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class CustomerSignature extends StatefulWidget {
  const CustomerSignature({super.key, required this.order});
  final Order order;

  @override
  State<CustomerSignature> createState() => _CustomerSignatureState();
}

class _CustomerSignatureState extends State<CustomerSignature> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    await showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              color: Colors.grey[300],
              child: Image.memory(bytes!.buffer.asUint8List()),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: SfSignaturePad(
                  key: signatureGlobalKey,
                  backgroundColor: Colors.white,
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 1.0,
                  maximumStrokeWidth: 4.0)),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              onPressed: () {
                // _handleSaveButtonPressed
                context.read<CheckOutBloc>().add(StepContinue());
              },
              label: const Text('Continue'),
            ),
            Expanded(
              child: TextButton(
                onPressed: _handleClearButtonPressed,
                child: const Text('Clear'),
              ),
            ),
            // ElevatedButton.icon(
            //   icon: const Icon(Icons.remove_red_eye),
            //   onPressed: _handleSaveButtonPressed,
            //   label: const Text('View'),
            // ),
          ])
        ]);
  }
}
