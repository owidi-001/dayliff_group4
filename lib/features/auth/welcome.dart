import 'package:dayliff/features/auth/login.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Move to the next page when the animation completes
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        // Reset the animation to prepare for the next cycle
        _animationController.reset();
        // Start the animation again
        _animationController.forward();
      }
    });

    // Start the animation
    _animationController.forward();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildLoginForm(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return PageView(
      controller: _pageController,
      children: [
        _buildBackgroundImage('assets/carousel/1.jpg'),
        _buildBackgroundImage('assets/carousel/2.jpg'),
        _buildBackgroundImage('assets/carousel/3.jpg'),
        _buildBackgroundImage('assets/carousel/4.jpg'),
        _buildBackgroundImage('assets/carousel/5.jpg'),
        _buildBackgroundImage('assets/carousel/6.jpg'),
      ],
    );
  }

  Widget _buildBackgroundImage(String imagePath) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Image.asset(
          imagePath,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          // color: const Color.fromRGBO(255, 255, 255, 0.5),
          colorBlendMode: BlendMode.modulate,
          alignment: FractionalOffset(_animationController.value, 0),
        );
      },
    );
  }

  Widget _buildLoginForm() {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: StaticColors.onPrimary,
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/logo.jpg',
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: Text(
                    'Effortless deliveries with a digital twist. Get started now!',
                    style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
                  child: PrimaryButton(
                    hint: 'Get Started',
                    onTap: () {
                      // Go to login
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Add username and password fields, buttons, etc.
        ],
      ),
    );
  }
}
