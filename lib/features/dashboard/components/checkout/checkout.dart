import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/comments.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/customer_signature.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/pod.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/scan_od.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/verify_customer.dart';
import 'package:dayliff/features/dashboard/components/checkout/widgets/count_timer.dart';
import 'package:dayliff/features/dashboard/components/home/order_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderCompletion extends StatefulWidget {
  final int orderId;

  const OrderCompletion({super.key, required this.orderId});

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
          },
          listenWhen: (previous, current) =>
              previous.message != current.message ||
              previous.status != current.status,
        )
      ],
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          final order = state.trips
              .expand((trip) => trip.orders)
              .firstWhere((order) => order.orderId == widget.orderId);
          return Scaffold(
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
                        child: ModalBarrier(
                            dismissible: false, color: Colors.black),
                      ),
                    if (state.status == ServiceStatus.submissionInProgress)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    Stepper(
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
                      onStepTapped: (step) {
                        context
                            .read<CheckOutBloc>()
                            .add(UpdateStep(step: step));
                      }, // Do nothing
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
                              child: VerifyCustomer(order: order)),
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
                              child: CustomerSignature(order: order)),
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
                              child: PODWidget(order: order)),
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
                              child: ODScanWidget(order: order)),
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
                              child: DeliveryComments(order: order)),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
