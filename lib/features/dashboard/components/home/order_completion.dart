import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:dio/dio.dart';

class OrderCompletion extends StatefulWidget {
  final Order order;

  OrderCompletion({required this.order});

  @override
  _OrderCompletionState createState() => _OrderCompletionState();
}

class _OrderCompletionState extends State<OrderCompletion> {
  TextEditingController commentsController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? otp = '';

  Future<void> _captureOrderImage() async {
    // TODO
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // You can save or upload the captured image as needed.
    }
  }

  Future<void> _verifyOTP(String enteredOTP) async {
    // TODO!
    // Implement OTP verification logic
    // You can use the enteredOTP and widget.order properties
  }

  Future<void> _completeOrder() async {
    // TODO!
    // Implement logic to complete the order
    // You can use the widget.order and commentsController.text
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Delivery'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order summary",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Table(
              border: TableBorder.all(),
              columnWidths: {
                0: const FlexColumnWidth(
                    2), // Adjust the column widths as needed
                1: const FlexColumnWidth(3),
              },
              children: [
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Order ID:'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${widget.order.orderId}'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Customer Name:'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${widget.order.customerName}'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Customer Phone:'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${widget.order.customerPhone}'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Order Date:'),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            '${AppUtility.formatDate(widget.order.orderDate)}'),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Status:'),
                      ),
                    ),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${widget.order.status.toStringValue()}',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppUtility.getStatusColor(
                                      widget.order.status, context),
                                ),
                      ),
                    )),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Capture Order Image:',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            ElevatedButton.icon(
              onPressed: _captureOrderImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Take a Photo'),
            ),
            const SizedBox(height: 16),
            Text(
              'Comments:',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            TextFormField(
              controller: commentsController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Enter OTP for Verification:',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 8),
            PinCodeTextField(
              appContext: context,
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              animationDuration: const Duration(milliseconds: 300),
              backgroundColor: Colors.blue.shade50,
              enableActiveFill: true,
              // errorAnimationController: errorController,
              controller: otpController,
              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {},
              beforeTextPaste: (text) {
                print("Allowing to paste $text");

                return true;
              },
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: () => _verifyOTP(otp!),
              child: const Text('Verify OTP'),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    onTap: () => _completeOrder(),
                    hint: 'Complete Order',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}
