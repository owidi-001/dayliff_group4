import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryComments extends StatelessWidget {
  const DeliveryComments({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    TextEditingController commentsController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: commentsController,
          maxLines: 3,
          textInputAction: TextInputAction.done,
          onSaved: (value) {
            context.read<CheckOutBloc>().add(CommentsChanged(comment: value));
          },
          decoration: const InputDecoration(
            hintText: "Closing comments",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          children: [
            BlocBuilder<ProcessingCubit, ProcessingState>(
              builder: (context, state) {
                return ElevatedButton.icon(
                  onPressed: () {
                    if (state.status == ServiceStatus.submissionInProgress) {
                      return;
                    } else if (!canComplete(state)) {
                      //  Show warning message
                      context.read<ProcessingCubit>().sendTextMessage(AppMessage(
                          message:
                              "Submit all steps to complete order confirmation",
                          tone: MessageTone.error));
                    } else {
                      context.read<ProcessingCubit>().orderConfirmationUpdate(
                          OrderConfirmation(
                            orderId: order.orderId,
                            comments: commentsController.text,
                            status: OrderStatus.COMPLETED
                                .toStringValue()
                                .toUpperCase(),
                          ),
                          StepComplete(),
                          isComplete: true);
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Complete delivery"),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  bool canComplete(ProcessingState state) {
    return state.confirmation != null &&
        (state.confirmation!.otp != null ||
            state.confirmation!.receiverId != null) &&
        (state.confirmation!.signature != null) &&
        (state.confirmation!.orderImages.isNotEmpty) &&
        state.confirmation!.dnote.isNotEmpty;
  }
}
