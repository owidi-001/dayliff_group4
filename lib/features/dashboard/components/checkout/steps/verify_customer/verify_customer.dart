import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/widgets/capture_id.dart';
import 'package:dayliff/features/dashboard/components/checkout/steps/verify_customer/widgets/verify_otp.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';

class VerifyCustomer extends StatefulWidget {
  const VerifyCustomer({super.key, required this.order});
  final Order order;

  @override
  State<VerifyCustomer> createState() => _VerifyCustomerState();
}

class _VerifyCustomerState extends State<VerifyCustomer>
    with SingleTickerProviderStateMixin {
  static const List<Tab> _tabs = <Tab>[
    Tab(text: 'By OTP'),
    Tab(text: 'By ID'),
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
            height: 250,
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
      ],
    );
  }
}
