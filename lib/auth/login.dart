import 'package:dayliff/dashboard/base.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Dashboard()));
          },
          child: const Text("Login")),
    );
  }
}
