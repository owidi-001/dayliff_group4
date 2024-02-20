import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/comments.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/customer_signature.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/pod.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/scan_od.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/verify_customer.dart';
import 'package:dayliff/features/dashboard/components/checkout/widgets/count_timer.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCompletion extends StatefulWidget {
  final Order order;

  const OrderCompletion({super.key, required this.order});

  @override
  State<OrderCompletion> createState() => _OrderCompletionState();
}

class _OrderCompletionState extends State<OrderCompletion> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CheckOutBloc, CheckoutState>(
          listener: (context, state) {
            if (state.message != null) {
              showOverlayMessage(state.message!);
            }
            if (state.checkoutSuccess) {
              // Go back
              Navigator.of(context).pop();
            }
          },
          listenWhen: (previous, current) =>
              previous.message != current.message ||
              previous.checkoutSuccess != current.checkoutSuccess ||
              previous.status != current.status,
        ),
        BlocListener<ProcessingCubit, ProcessingState>(
          listener: (context, state) {
            if (state.message != null) {
              showOverlayMessage(state.message!);
            }

            // if (state.status == ServiceStatus.submissionInProgress) {
            //   showDialog(
            //       context: context,
            //       builder: (context) => const Dialog(
            //             child: Center(
            //               child: CircularProgressIndicator(),
            //             ),
            //           ));
            // }
          },
          listenWhen: (previous, current) =>
              previous.message != current.message ||
              previous.status != current.status,
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StaticColors.primary,
          foregroundColor: StaticColors.onPrimary,
          title: const CountUpTimer(),
        ),
        body: BlocBuilder<CheckOutBloc, CheckoutState>(
          builder: (context, state) {
            return Stack(
              children: [
                if (state.status == ServiceStatus.submissionInProgress)
                  const Opacity(
                    opacity: 0.8,
                    child:
                        ModalBarrier(dismissible: false, color: Colors.black),
                  ),
                if (state.status == ServiceStatus.submissionInProgress)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                Stepper(
                  // stepIconBuilder: (stepIndex, stepState) {
                  //   switch (stepState) {
                  //     case StepState.complete:
                  //       return Icon(FontAwesomeIcons.check);
                  //     default:
                  //       return Icon(FontAwesomeIcons.)
                  //   }
                  // },
                  controlsBuilder:
                      (BuildContext context, ControlsDetails details) {
                    return const SizedBox.shrink();
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
                    bool isLastStep = (state.step == 5);
                    if (!isLastStep) {
                      context
                          .read<CheckOutBloc>()
                          .add(UpdateStep(step: state.step + 1));
                    }
                  },
                  onStepTapped: null, // Do nothing
                  // steps: getSteps(),
                  steps: [
                    Step(
                      isActive: state.step >= 0,
                      title: Text(
                        "Verifing Customer",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: StaticColors.primary),
                      ),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: VerifyCustomer(order: widget.order)),
                    ),
                    Step(
                      isActive: state.step >= 1,
                      title: Text(
                        "Customer Signing",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: StaticColors.primary),
                      ),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: CustomerSignature(order: widget.order)),
                    ),
                    Step(
                      isActive: state.step >= 2,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Proof of delivery",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: StaticColors.primary),
                          ),
                          Text(
                            "${state.orderImages.length}/5",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: StaticColors.primary),
                          )
                        ],
                      ),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: PODWidget(order: widget.order)),
                    ),
                    Step(
                      isActive: state.step >= 3,
                      title: Text(
                        "Scan Delivery Note",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: StaticColors.primary),
                      ),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: ODScanWidget(order: widget.order)),
                    ),
                    Step(
                      isActive: state.step >= 4,
                      title: Text(
                        "Comments",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: StaticColors.primary),
                      ),
                      content: Container(
                          alignment: Alignment.centerLeft,
                          child: DeliveryComments(order: widget.order)),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
