import 'package:dayliff/data/models/messages/app_message.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/bloc/verify_cubit.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/widgets/capture_id.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyCustomer extends StatefulWidget {
  const VerifyCustomer({super.key, required this.order});
  final Order order;

  @override
  State<VerifyCustomer> createState() => _VerifyCustomerState();
}

class _VerifyCustomerState extends State<VerifyCustomer>
    with SingleTickerProviderStateMixin {
  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'OTP'),
    Tab(text: 'ID'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<VerificationMeans>> get dropdownItems {
    List<DropdownMenuItem<VerificationMeans>> menuItems = [
      const DropdownMenuItem(value: VerificationMeans.OTP, child: Text("OTP")),
      const DropdownMenuItem(value: VerificationMeans.ID, child: Text("ID"))
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOutSine,
          child: SizedBox(
            height: 200,
            child: TabBarView(
              controller: _tabController,
              children: [
                ByOTP(id: widget.order.orderId),
                ByID(
                  id: widget.order.orderId,
                )
              ],
            ),
          ),
        ),
        BlocBuilder<CheckOutBloc, CheckoutState>(
          builder: (context, state) {
            return state.idPhoto != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          showOverlayMessage(
                            AppMessage(
                                message:
                                    "Please verify receiver by either ID or OTP",
                                tone: MessageTone.error),
                          );
                        },
                        icon: const Icon(
                          FontAwesomeIcons.cloudArrowUp,
                          size: 16,
                        ),
                        label: const Text("Continue"),
                      ),
                    ],
                  )
                : const SizedBox.shrink();
          },
        )
      ],
    );
  }
}

class ByOTP extends StatefulWidget {
  const ByOTP({super.key, required this.id});
  final int id;

  @override
  State<ByOTP> createState() => _ByOTPState();
}

class _ByOTPState extends State<ByOTP> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    return Form(
      key: _otpFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Text(
            "Enter receiver's OTP",
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      activeColor: StaticColors.primary,
                      activeFillColor: StaticColors.primary.withOpacity(.2),
                      selectedFillColor: StaticColors.primary.withOpacity(.2),
                      selectedColor: StaticColors.primary,
                      fieldWidth: 40,
                      inactiveColor: Colors.grey.shade400,
                      inactiveFillColor:
                          Theme.of(context).colorScheme.onPrimary),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: otpController,
                  onCompleted: (v) {
                    if (_otpFormKey.currentState!.validate()) {
                      // Submit OTP
                      context
                          .read<ProcessingCubit>()
                          .otpValidation(v, widget.id, StepContinue());
                    } else {
                      showOverlayMessage(AppMessage(
                          message: "Fill in the otp", tone: MessageTone.error));
                    }
                  },

                  onChanged: (value) {
                    context.read<CheckOutBloc>().add(OtpChanged(otp: value));
                  },
                  validator: (value) {
                    if (value!.length < 3) {
                      return "OTP too short";
                    } else {
                      return null;
                    }
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    return true;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
