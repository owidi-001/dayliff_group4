import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/auth/welcome.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              "assets/logo.jpg",
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
      // Navigate to dashboard
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Dashboard()));
    } else if (mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Welcome()));
    }
  }
}
