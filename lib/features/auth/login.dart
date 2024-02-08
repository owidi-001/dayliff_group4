import 'dart:ui';

import 'package:dayliff/data/models/auth/login.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/auth/reset_password.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:video_player/video_player.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State createState() {
    return _Login();
  }
}

class _Login extends State<Login> {
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
            backgroundColor: Colors.black38,
            body: PageView(
              controller: _controller,
              children: [
                Welcome(pageController: _controller),
                const LoginForm(),
              ],
            )),
      );
    });
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image or blur effect
          const Positioned.fill(child: VideoPlayerScreen()),
          Positioned.fill(
              child: Container(
            decoration: const BoxDecoration(color: Colors.black26),
          )),
          // Contents of the welcome screen
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: AppBar().preferredSize.height * 5),
              const Spacer(),
              AnimateInEffect(
                keepAlive: true,
                intervalStart: 0,
                child: GlassmorphicContainer(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  height: 350,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title text
                      const Text(
                        'Welcome to Daylivery',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Description text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          'Get ready to experience the ultimate tool for truck drivers. With Daylivery, you can manage your routes, track your deliveries, and stay connected with your team on the go.',
                          style: TextStyle(
                            color: StaticColors.onPrimary.withOpacity(.8),
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Login button
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to login screen
                          pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.bounceIn);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: StaticColors.onPrimary,
                          backgroundColor: StaticColors.primary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            top: AppBar().preferredSize.height,
            child: // Company logo
                AnimateInEffect(
              keepAlive: true,
              intervalStart: 0,
              child: Image.asset(
                'assets/logo2.png',
                height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePass = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      emailController.text = "elijah@dayliff.com";
      passwordController.text = "password";
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
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/carousel/5.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              AnimateInEffect(
                keepAlive: true,
                intervalStart: 0,
                child: GlassmorphicContainer(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
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
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            height: 60,
                            child: TextField(
                              controller: emailController,
                              style: TextStyle(color: StaticColors.onPrimary),
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: StaticColors.onPrimary.withOpacity(.6),
                                ),
                                labelText: "Email Address",
                                labelStyle:
                                    TextStyle(color: StaticColors.onPrimary),
                                hintStyle:
                                    TextStyle(color: StaticColors.onPrimary),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  borderSide:
                                      BorderSide(color: StaticColors.onPrimary),
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
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextField(
                              controller: passwordController,
                              style: TextStyle(color: StaticColors.onPrimary),
                              obscureText: obscurePass,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                }),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "Or Login using ",
                                children: [
                                  TextSpan(
                                    text: "Ad Account",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () =>
                                          showSnackBar(context, "Coming soon"),
                                    style: TextStyle(
                                      color: StaticColors.primary,
                                    ),
                                  )
                                ],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                          ),
                          const SizedBox(
                            height: 15,
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
          Positioned(
            left: 0,
            right: 0,
            top: AppBar().preferredSize.height,
            child: // Company logo
                AnimateInEffect(
              keepAlive: true,
              intervalStart: 0,
              child: Image.asset(
                'assets/logo2.png',
                height: 100,
              ),
            ),
          )
        ],
      ),
    );
  }
}

// Video background
class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/welcome.mp4")
      ..play()
      ..setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
