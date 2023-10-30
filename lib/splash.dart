import 'package:dayliff/auth/login.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const Login())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(""),),);
  }
}
