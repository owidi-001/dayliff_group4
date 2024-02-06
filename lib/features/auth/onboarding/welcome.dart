import 'dart:async';
import 'dart:ui';

import 'package:dayliff/features/auth/login.dart';
import 'package:dayliff/features/auth/onboarding/bloc/bloc.dart';
import 'package:dayliff/features/auth/onboarding/models/content.dart';
import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Create the Onboarding widget.
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  // Implement the timer to automatically transition to the next page.
  late Timer _timer;
  late PageController pageController;

  @override
  void initState() {
    // pageController = PageController(initialPage: 0);
    super.initState();
    // _startTimer();
  }

  // void _startTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
  //     if (context.read<OnboardingBloc>().state.position <
  //         context.read<OnboardingBloc>().state.contents.length - 1) {
  //       context.read<OnboardingBloc>().add(PageChangedEvent(
  //           position: context.read<OnboardingBloc>().state.position++));
  //     } else {
  //       _timer.cancel();
  //       Future.delayed(const Duration(seconds: 3), () {
  //         context
  //             .read<OnboardingBloc>()
  //             .add(const PageChangedEvent(position: 0));
  //         _startTimer();
  //       });
  //     }
  //   });
  // }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return PageView.builder(
            controller: state.pageController,
            itemCount: state.contents.length,
            onPageChanged: (int page) {
              context
                  .read<OnboardingBloc>()
                  .add(PageChangedEvent(position: page));
            },
            itemBuilder: (BuildContext context, int index) {
              return const _PageContent();
            },
          );
        },
      ),
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final OnboardingContent content = state.contents[state.position];
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              content.imageUrl,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: state.position == state.contents.length - 1
                  ? AppBar().preferredSize.height * 2
                  : AppBar().preferredSize.height,
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
                        content.title,
                        textAlign: TextAlign.left,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(height: AppBar().preferredSize.height / 2),
                      Text(
                        content.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: AppBar().preferredSize.height,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.contents.length,
                          (int index) {
                            return Container(
                              width: 8.0,
                              height: 8.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: state.position <= index
                                    ? Colors.white.withOpacity(.4)
                                    : Colors.white,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: AppBar().preferredSize.height,
              left: 0,
              right: 0,
              child:
                  SizedBox(height: 100, child: Image.asset("assets/logo.png")),
            ),
            Positioned(
              bottom: AppBar().preferredSize.height,
              child: BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        state.position == state.contents.length - 1
                            ? Expanded(
                                child: PrimaryButton(
                                    onTap: () {
                                      // context.read<OnboardingBloc>().add(
                                      //     PageChangedEvent(
                                      //         position: state.position++));
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    // icon: const Icon(Icons.skip_next),

                                    hint: "Get Started"),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
