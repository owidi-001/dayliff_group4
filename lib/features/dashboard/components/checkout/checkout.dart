import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/comments.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/confirm_order_details.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/customer_signature.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/scan_od.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCompletion extends StatefulWidget {
  final Order order;

  const OrderCompletion({super.key, required this.order});

  @override
  State<OrderCompletion> createState() => _OrderCompletionState();
}

class _OrderCompletionState extends State<OrderCompletion> {
  List<Step> getSteps() {
    return <Step>[
      Step(
        title: Text(
          "Confirming Order Info",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        content: Container(
          alignment: Alignment.centerLeft,
          child: OrderSummary(order: widget.order),
        ),
      ),
      Step(
        title: Text(
          "Verifing Customer",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        content: Container(
            alignment: Alignment.centerLeft,
            child: VerifyCustomer(order: widget.order)),
      ),
      Step(
        title: Text(
          "Customer Signing",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        content: Container(
            alignment: Alignment.centerLeft,
            child: CustomerSignature(order: widget.order)),
      ),
      Step(
        title: Text(
          "Scanning Delivery Note",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        content: Container(
            alignment: Alignment.centerLeft,
            child: ScanOD(order: widget.order)),
      ),
      Step(
        title: Text(
          "Comments",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        content: Container(
            alignment: Alignment.centerLeft,
            child: DeliveryComments(order: widget.order)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckOutBloc, CheckoutState>(
      listener: (context, state) {
        if (state.message != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message!)));
        }
      },
      listenWhen: (previous, current) => previous.message != current.message,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Complete Delivery'),
        ),
        body: BlocBuilder<CheckOutBloc, CheckoutState>(
          builder: (context, state) {
            return Stepper(
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return const SizedBox.shrink();
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: ElevatedButton(
                  //         onPressed: details.onStepContinue,
                  //         child: Text('Custom Continue'),
                  //       ),
                  //     ),
                  //     if (details.currentStep > 0)
                  //       Expanded(
                  //         child: ElevatedButton(
                  //           onPressed: details.onStepCancel,
                  //           child: Text('Custom Cancel'),
                  //         ),
                  //       ),
                  //   ],
                  // );
                },
                currentStep: state.step,
                onStepCancel: () {
                  if (state.step > 0) {
                    context
                        .read<CheckOutBloc>()
                        .add(UpdateStep(step: state.step - 1));
                  }
                },
                onStepContinue: () {
                  bool isLastStep = (state.step == getSteps().length - 1);
                  if (!isLastStep) {
                    context
                        .read<CheckOutBloc>()
                        .add(UpdateStep(step: state.step + 1));
                  }
                },
                onStepTapped: null, // Do nothing
                steps: getSteps());
          },
        ),
      ),
    );
  }
}
