import 'package:dayliff/data/models/auth/login.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/auth/reset_password.dart';
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
  bool obsecurePass = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      emailController.text = "elijah@dayliff.com";
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
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
                // Container(
                //   height: 120,
                //   width: 120,
                //   decoration: const BoxDecoration(
                //     color: Colors.transparent,
                //   ),
                //   child: const ClipRRect(
                //     child: Image(
                //       image: AssetImage('assets/logo.png'),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                Text(
                  "Welcome!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  "Validate credentials to get started",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      // suffix: const Icon(Icons.clear),
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
                  obscureText: obsecurePass,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      suffix: GestureDetector(
                          onTap: () => setState(() {
                                obsecurePass = !obsecurePass;
                              }),
                          child: Icon(obsecurePass
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ResetPassword()));
                        },
                        child: const Text("Forgot password?"))
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        hint: "Login",
                        onTap: () {
                          context.read<AuthBloc>().add(
                                LocalLogin(
                                  data: LoginResponse(
                                    token: "",
                                    user: User(
                                        id: -1,
                                        name: "Elijah Mbugua",
                                        phoneNumber: "0791381653",
                                        email: "elijah@dayliff.com",
                                        status: "Active"),
                                  ),
                                ),
                              );

                          // TODO verify form data
                          // context.read<AuthBloc>().add(
                          //       LoginEvent(
                          //         email: emailController.text,
                          //         password: passwordController.text.trim(),
                          //       ),
                          //     );
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
