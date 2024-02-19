import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/bloc/bloc.dart';
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
            ElevatedButton.icon(
              onPressed: () {
                context.read<ProcessingCubit>().orderConfirmationUpdate(
                    OrderConfirmation(
                      orderId: order.orderId!,
                      comments: commentsController.text,
                      status:
                          OrderStatus.COMPLETED.toStringValue().toUpperCase(),
                    ),
                    StepComplete());
              },
              icon: const Icon(Icons.check),
              label: const Text("Complete delivery"),
            ),
          ],
        ),
      ],
    );
  }
}
