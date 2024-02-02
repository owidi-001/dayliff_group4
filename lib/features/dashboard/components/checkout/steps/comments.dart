import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliveryComments extends StatelessWidget {
  const DeliveryComments({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    TextEditingController commentsController = TextEditingController();
    return TextFormField(
      controller: commentsController,
      maxLines: 3,
      onChanged: (value) {
        context.read<CheckOutBloc>().add(CommentsChanged(comment: value));
      },
      decoration: const InputDecoration(
        hintText: "Closing comments",
        border: OutlineInputBorder(),
      ),
    );
  }
}
