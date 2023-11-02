import 'package:dayliff/bloc/auth/bloc.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      emailController.text = "nafu2@g.com";
      passwordController.text = "password";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state.loginSuccess) {
          // Redirect to dashboard
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ),
          );
        }
      },
      listenWhen: (previous, current) =>
          previous.loginSuccess != current.loginSuccess,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                Center(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      )),
                ),
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        hint: "Login",
                        onTap: () {
                          // TODO verify form data
                          context.read<AuthBloc>().add(
                                LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text.trim(),
                                ),
                              );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
