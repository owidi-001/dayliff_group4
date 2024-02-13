import 'dart:async';

import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/features/auth/login.dart';
import 'package:dayliff/features/dashboard/components/home/home.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late StreamSubscription<AuthenticationStatus> _subscription;
  @override
  void initState() {
    super.initState();
    _subscription = AuthenticationRepository.instance.stream.listen((status) {
      if (status == AuthenticationStatus.unauthenticated) {
        // Navigate to login screen
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: ((context) => const Login())));
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authBloc = context.read<AuthBloc>().state;
    // // Check auth
    // if (authBloc.status == ServiceStatus.initial ||
    //     !authBloc.loginSuccess ||
    //     authBloc.user == null) {
    //   // Return to login
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const Login()));
    // }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: StaticColors.primary,
      ),
    );
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: Home(),
    );
  }
}
