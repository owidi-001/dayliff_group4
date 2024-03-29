import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/auth/auth_bloc/bloc.dart';
import 'package:dayliff/features/auth/reset_password.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/home/order_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/overlay_notifications.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePass = true;

  @override
  void initState() {
    super.initState();

    context.read<AuthenticationRepository>().stream.listen((event) {
      if (event == AuthenticationStatus.unauthenticated) {
        context.read<OrderBloc>().add(ResetOrders());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.message != null) {
          showOverlayMessage(state.message!);
        }
      },
      listenWhen: (previous, current) => previous.message != current.message,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/carousel/5.jpg"),
              fit: BoxFit.cover,
            ),
            color: Colors.black),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: AppBar().preferredSize.height,
                ),
                AnimateInEffect(
                  keepAlive: true,
                  intervalStart: 0,
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width / 2,
                ),
                AnimateInEffect(
                  keepAlive: true,
                  intervalStart: 0,
                  child: GlassmorphicContainer(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    height: 400,
                    borderRadius: 20,
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
                    child: Form(
                      key: formKey,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: StaticColors.onPrimary),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Please Login to Your Account",
                              style: TextStyle(
                                color: StaticColors.onPrimary.withOpacity(.6),
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height: 60,
                              child: TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  String emailPattern =
                                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                                  RegExp regex = RegExp(emailPattern);
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter an email';
                                  } else if (!regex.hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  } else {
                                    return null;
                                  }
                                },
                                style: TextStyle(color: StaticColors.onPrimary),
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.email,
                                    color:
                                        StaticColors.onPrimary.withOpacity(.6),
                                  ),
                                  labelText: "Email Address",
                                  labelStyle:
                                      TextStyle(color: StaticColors.onPrimary),
                                  hintStyle:
                                      TextStyle(color: StaticColors.onPrimary),
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: StaticColors.onPrimary),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: StaticColors
                                            .onPrimary), // Brighter color when focused
                                  ),
                                  focusColor: StaticColors.onPrimary,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              height: 60,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                controller: passwordController,
                                style: TextStyle(color: StaticColors.onPrimary),
                                obscureText: obscurePass,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter a password';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelStyle:
                                      TextStyle(color: StaticColors.onPrimary),
                                  hintStyle:
                                      TextStyle(color: StaticColors.onPrimary),
                                  border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: StaticColors
                                            .onPrimary), // Brighter color when focused
                                  ),
                                  focusColor: StaticColors.onPrimary,
                                  suffixIcon: TextButton(
                                    onPressed: () {
                                      // Navigate to reset password screen
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ResetPassword(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          color: StaticColors.onPrimary
                                              .withOpacity(.6)),
                                    ),
                                  ),
                                  labelText: "Password",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            BlocBuilder<AuthBloc, AuthState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: PrimaryButton(
                                    hint: "Login",
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        context.read<AuthBloc>().add(LoginEvent(
                                            email: emailController.text,
                                            password: passwordController.text));
                                      }
                                    },
                                    isLoading: state.status ==
                                        ServiceStatus.submissionInProgress,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppBar().preferredSize.height,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
