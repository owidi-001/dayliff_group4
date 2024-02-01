import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  bool obsecurePass = true;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      emailController.text = "nafu2@g.com";
      // otpController.text = "password";
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primary,
      ),
    );
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
            title: const Text("Reset Password"),
          ),
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Follow the steps below to reset password",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Stepper(
                    currentStep: _index,
                    onStepCancel: () {
                      if (_index > 0) {
                        setState(() {
                          _index -= 1;
                        });
                      }
                    },
                    onStepContinue: () {
                      if (_index <= 0) {
                        setState(() {
                          _index += 1;
                        });
                      }
                    },
                    onStepTapped: (int index) {
                      setState(() {
                        _index = index;
                      });
                    },
                    steps: <Step>[
                      Step(
                        title: const Text('Get OTP'),
                        content: Container(
                          alignment: Alignment.centerLeft,
                          child: Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Enter your company email address",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.email),
                                      // suffix: const Icon(Icons.clear),
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          20, 15, 20, 15),
                                      hintText: "Email",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Step(
                        title: const Text('Validate OTP'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(8),
                                        fieldHeight: 50,
                                        fieldWidth: 40,
                                        activeFillColor: Colors.white,
                                        inactiveFillColor: Theme.of(context)
                                            .colorScheme
                                            .onPrimary),
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    // backgroundColor: Colors.blue.shade50,
                                    backgroundColor: Colors.transparent,
                                    enableActiveFill: true,
                                    // errorAnimationController: errorController,
                                    controller: otpController,
                                    onCompleted: (v) {
                                      print("Completed");
                                    },

                                    onChanged: (value) {
                                      //  TODO! Reset
                                    },
                                    beforeTextPaste: (text) {
                                      print("Allowing to paste $text");

                                      return true;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
