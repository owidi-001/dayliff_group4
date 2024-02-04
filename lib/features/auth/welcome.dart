import 'package:dayliff/features/auth/login.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: StaticColors.primary.withOpacity(.3),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(color: StaticColors.primary),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                          color: StaticColors.onPrimary.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).width +
                              AppBar().preferredSize.height),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: Image.asset(
                              'assets/logo.jpg',
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 32, right: 16, bottom: 8),
                            child: Text(
                              'D&S Cargo Flow',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: StaticColors.primary,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 16),
                            child: Text(
                              'Effortless deliveries with a digital twist. Get started now!',
                              style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 40.0, left: 40.0, top: 40),
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
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    SvgPicture.asset(
                      "assets/welcome.svg",
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
