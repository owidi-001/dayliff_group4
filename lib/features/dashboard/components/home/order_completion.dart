import 'dart:io';

import 'package:dayliff/bloc/order_confirmation/bloc.dart';
import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/data/models/route/route.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OrderCompletion extends StatefulWidget {
  final Order order;

  const OrderCompletion({super.key, required this.order});

  @override
  State<OrderCompletion> createState() => _OrderCompletionState();
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
      // Add image captured to state
      context.read<OrderConfirmationBloc>().add(
            SaveCapturedImage(
              image: File(image.path),
            ),
          );
    }
  }

  Future<void> _verifyOTP(String enteredOTP) async {
    // TODO!
    // Implement OTP verification logic
    // You can use the enteredOTP and widget.order properties
    context
        .read<OrderConfirmationBloc>()
        .add(VerifyOTP(code: "1234"));
    
  }

  Future<void> _completeOrder() async {
    // TODO!
    // Implement logic to complete the order
    // You can use the widget.order and commentsController.text
    context.read<OrderConfirmationBloc>().add(ConfirmDelivery());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Delivery'),
      ),
      body: BlocBuilder<OrderConfirmationBloc, ConfirmationState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  constraints: const BoxConstraints(minHeight: 100),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FlexColumnWidth(
                          2), // Adjust the column widths as needed
                      1: FlexColumnWidth(3),
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
                              child: Text(widget.order.customerName),
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
                              child: Text(widget.order.customerPhone),
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
                              child: Text(AppUtility.formatDate(
                                  widget.order.orderDate)),
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
                              widget.order.status.toStringValue(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: AppUtility.getStatusColor(
                                        widget.order.status, context),
                                  ),
                            ),
                          )),
                        ],
                      ),
                    ],
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  constraints: const BoxConstraints(minHeight: 100),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.sizeOf(context).width * .8),
                            child: PinCodeTextField(
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
                                  inactiveFillColor:
                                      Theme.of(context).colorScheme.onPrimary),
                              animationDuration:
                                  const Duration(milliseconds: 300),
                              // backgroundColor: Colors.blue.shade50,
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              // errorAnimationController: errorController,
                              controller: otpController,
                              onCompleted: (v) {
                                print("Completed");
                              },
                              
                              onChanged: (value) {
                                context
                                    .read<OrderConfirmationBloc>()
                                    .add(OtpChanged(otp: value));
                              },
                              beforeTextPaste: (text) {
                                print("Allowing to paste $text");

                                return true;
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () => _verifyOTP(otp!),
                        child: const Text('Verify OTP'),
                      ),
                    ],
                  ),
                ),
                // Toggle verified
                ...state.otpVerified
                    ? [
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          'Capture Order Image:',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          constraints: const BoxConstraints(minHeight: 100),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BlocBuilder<OrderConfirmationBloc,
                                  ConfirmationState>(
                                builder: (context, state) {
                                  if (state.orderImages.isNotEmpty) {
                                    return SizedBox(
                                      height: 150,
                                      child: ListView.builder(
                                          itemCount: state.orderImages.length,
                                          scrollDirection: Axis.horizontal,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) =>
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 16),
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxHeight: 150,
                                                          maxWidth: 150),
                                                  child: Image.file(
                                                    state.orderImages[index],
                                                    fit: BoxFit.contain,
                                                  ))),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ElevatedButton.icon(
                                onPressed: _captureOrderImage,
                                icon: const Icon(Icons.camera_alt),
                                label: const Text('Take a Photo'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Comments:',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16),
                          // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          constraints: const BoxConstraints(minHeight: 100),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: commentsController,
                            maxLines: 3,
                            onChanged: (value) {
                              context
                                  .read<OrderConfirmationBloc>()
                                  .add(CommentsChanged(comment: value));
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
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
                      ]
                    : [
                        // No widgets
                      ],
              ],
            ),
          );
        },
      ),
    );
  }
}
