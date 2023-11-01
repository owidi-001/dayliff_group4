import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/auth/widgets/sine_loader.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      phoneController.text = "johndoe@gmail.com";
      passwordController.text = "@pass_123";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: phoneController,
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
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const Dashboard(),
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
    );
  }
}
