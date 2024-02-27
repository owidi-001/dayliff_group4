import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/auth/auth_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(
              "assets/logo.png",
              fit: BoxFit.contain,
            )),
      ),
    );
  }

  void _checkUser() async {
    final userData = await AppUtility().getUserData();
    if (userData != null && mounted) {
      debugPrint(userData.toJson().toString());
      context.read<AuthBloc>().add(LocalLogin(data: userData));
      context.goNamed("dashboard");
    } else if (mounted) {
      context.goNamed("welcome");
    }
  }
}
