import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
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
  final passwordController = TextEditingController();
  bool obsecurePass = true;
  int _index = 0;

  @override
  void initState() {
    super.initState();

    setState(() {
      emailController.text = "elijah@dayliff.com";
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
            elevation: 0,
            title: const Text("Reset Password"),
          ),
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/carousel/5.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                GlassmorphicContainer(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  borderRadius: 0,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 0,
                  linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.1),
                      const Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: const [0.1, 1],
                  ),
                  borderGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.5),
                      const Color((0xFFFFFFFF)).withOpacity(0.5),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppBar().preferredSize.height,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Follow the steps below to reset password",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Stepper(
                        stepIconBuilder: (stepIndex, stepState) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: StaticColors.onPrimary),
                            child: Icon(
                              stepIndex == 0
                                  ? Icons.security
                                  : stepIndex == 1
                                      ? Icons.verified_user
                                      : Icons.password,
                              color: _index >= stepIndex
                                  ? StaticColors.primary
                                  : StaticColors.dark,
                            ),
                          );
                        },
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
                        controlsBuilder: (context, details) {
                          return Container();
                        },
                        steps: <Step>[
                          Step(
                            title: Text(
                              'Get OTP',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            content: Container(
                              alignment: Alignment.centerLeft,
                              child: Form(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Enter your company email address",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      controller: emailController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textInputAction: TextInputAction.next,
                                      validator: validateEmail,
                                      onSaved: (String? val) {
                                        // TODO
                                      },
                                      style: const TextStyle(fontSize: 18.0),
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: StaticColors.primary,
                                      decoration: getInputDecoration(
                                          hint: 'Email Address',
                                          darkMode: false,
                                          errorColor: Theme.of(context)
                                              .colorScheme
                                              .error),
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            _index += 1;
                                          });
                                        },
                                        child: const Text("Get OTP"))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Step(
                            title: Text(
                              'Verify OTP',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                            shape: PinCodeFieldShape.circle,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            fieldHeight: 50,
                                            fieldWidth: 40,
                                            inactiveColor: Colors.grey.shade400,
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
                                          debugPrint("Completed");
                                        },

                                        onChanged: (value) {
                                          //  TODO! Reset
                                        },
                                        beforeTextPaste: (text) {
                                          debugPrint("Allowing to paste $text");

                                          return true;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _index += 1;
                                      });
                                    },
                                    child: const Text("Verify OTP"))
                              ],
                            ),
                          ),
                          Step(
                            title: Text(
                              'Set New Password',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
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
                                    style: const TextStyle(fontSize: 18.0),
                                    cursorColor: StaticColors.primary,
                                    decoration: getInputDecoration(
                                        hint: 'Password',
                                        darkMode: false,
                                        errorColor: Theme.of(context)
                                            .colorScheme
                                            .error)),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
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
                                    style: const TextStyle(fontSize: 18.0),
                                    cursorColor: StaticColors.primary,
                                    decoration: getInputDecoration(
                                        hint: 'Confirm Password',
                                        darkMode: false,
                                        errorColor: Theme.of(context)
                                            .colorScheme
                                            .error)),
                                const SizedBox(
                                  height: 16,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Save Password"))
                              ],
                            ),
                          ),
                        ],
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
