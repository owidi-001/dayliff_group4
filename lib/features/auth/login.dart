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
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: StaticColors.primary),
              elevation: 0.0,
              title: Text(
                'Sign In',
                style: TextStyle(
                    color: StaticColors.primary,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    Container(
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: const ClipRRect(
                        child: Image(
                          image: AssetImage('assets/logo.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
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
                          style: const TextStyle(fontSize: 18.0),
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: StaticColors.primary,
                          decoration: getInputDecoration(
                              hint: 'Email Address',
                              darkMode: false,
                              errorColor: Theme.of(context).colorScheme.error)),
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
                          style: const TextStyle(fontSize: 18.0),
                          cursorColor: StaticColors.primary,
                          decoration: getInputDecoration(
                              hint: 'Password',
                              darkMode: false,
                              errorColor: Theme.of(context).colorScheme.error)),
                    ),

                    /// forgot password text, navigates user to ResetPasswordScreen
                    /// and this is only visible when logging with email and password
                    Padding(
                      padding: const EdgeInsets.only(top: 16, right: 24),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const ResetPassword()));
                          },
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: StaticColors.primary,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 2,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade400),
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'OR',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Container(
                            height: 2,
                            width: double.infinity,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade400),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: PrimaryOutlined(
                        
                        onTap: () async {
                          //
                        },
                        hint: 'AD Login',
                      ),
                    ),
                  ],
                ),
              ),
            )),
      );
    });
  }
}
