import 'dart:ui';

import 'package:dayliff/data/models/auth/login.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/auth/reset_password.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
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
    return Builder(builder: (context) {
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
          if (state.message != null) {
            showSnackBar(context, state.message!);
          }
        },
        listenWhen: (previous, current) =>
            previous.loginSuccess != current.loginSuccess ||
            previous.message != current.message,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/carousel/3.jpg",
                  ),
                  fit: BoxFit.fitHeight)),
          child: Scaffold(
              backgroundColor: Colors.black38,
              body: Stack(
                fit: StackFit.expand,
                children: [
                  // BackgroundVideo(),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: AppBar().preferredSize.height,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        margin: const EdgeInsets.all(16),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text(
                              "Sign In",
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 32.0, right: 24.0, left: 24.0),
                              child: TextFormField(
                                  controller: emailController,
                                  textAlignVertical: TextAlignVertical.center,
                                  textInputAction: TextInputAction.next,
                                  validator: validateEmail,
                                  onSaved: (String? val) {
                                    // TODO
                                  },
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: StaticColors.onPrimary),
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: StaticColors.primary,
                                  decoration: getInputDecoration(
                                      hint: 'Email Address',
                                      darkMode: true,
                                      errorColor:
                                          Theme.of(context).colorScheme.error)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 32.0, right: 24.0, left: 24.0),
                              child: TextFormField(
                                  controller: passwordController,
                                  textAlignVertical: TextAlignVertical.center,
                                  obscureText: true,
                                  validator: validatePassword,
                                  onSaved: (String? val) {
                                    // TODO
                                  },
                                  onFieldSubmitted: (password) {
                                    // TODO
                                  },
                                  textInputAction: TextInputAction.done,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: StaticColors.onPrimary),
                                  cursorColor: StaticColors.primary,
                                  decoration: getInputDecoration(
                                      hint: 'Password',
                                      darkMode: true,
                                      errorColor:
                                          Theme.of(context).colorScheme.error)),
                            ),

                            /// forgot password text, navigates user to ResetPasswordScreen
                            /// and this is only visible when logging with email and password
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, right: 24),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPassword()));
                                  },
                                  child: Text(
                                    'Forgot password?',
                                    style: TextStyle(
                                        color: StaticColors.onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 16),
                              child: PrimaryButton(
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
                                hint: 'Login',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppBar().preferredSize.height,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                        height: 100, child: Image.asset("assets/logo.png")),
                  ),
                  // BackgroundVideo(),
                ],
              )),
        ),
      );
    });
  }
}
