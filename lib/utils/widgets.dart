import 'package:dayliff/utils/constants.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class LoadingIllustrator extends StatelessWidget {
  const LoadingIllustrator({super.key});

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven
                ? StaticColors.primary
                : Theme.of(context).colorScheme.tertiary,
          ),
        );
      },
    );
    return spinkit;
  }
}

// Retry
class RetryContainer extends StatelessWidget {
  const RetryContainer(
      {super.key,
      required this.description,
      required this.onTap,
      required this.title});
  final String title;
  final String description;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
              height: 200, width: 200, child: LottieLoader(name: 'error')),
          Text(description),
          TextButton(onPressed: onTap, child: const Text("Retry"))
        ],
      ),
    );
  }
}

// Animation
class AnimateInEffect extends StatefulWidget {
  const AnimateInEffect({
    Key? key,
    required this.child,
    this.intervalStart = 0,
    this.keepAlive = false,
  }) : super(key: key);

  final Widget child;
  final double intervalStart;
  final bool keepAlive;

  @override
  State<AnimateInEffect> createState() => _AnimateInEffectState();
}

class _AnimateInEffectState extends State<AnimateInEffect>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController animationController;
  late final Animation<Offset> offsetAnimation;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    Future.delayed(
      const Duration(milliseconds: 300),
      () => animationController.forward(),
    );

    Curve intervalCurve = Interval(
      widget.intervalStart,
      1,
      curve: Curves.easeOut,
    );

    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 30),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: intervalCurve,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: intervalCurve,
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) => Transform.translate(
        offset: offsetAnimation.value,
        child: child,
      ),
      child: FadeTransition(
        opacity: fadeAnimation,
        child: widget.child,
      ),
    );
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}

// Lottie box

class LottieLoader extends StatefulWidget {
  const LottieLoader({super.key, required this.name});
  final String name;

  @override
  State<LottieLoader> createState() => _LottieLoaderState();
}

class _LottieLoaderState extends State<LottieLoader>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/illustrations/${widget.name}.json',
      controller: _controller,
      onLoaded: (composition) {
        // Configure the AnimationController with the duration of the
        // Lottie file and start the animation.
        _controller
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}

// Shimmer box
class SkeletonLoader extends StatefulWidget {
  const SkeletonLoader({super.key});

  @override
  State<SkeletonLoader> createState() => _SkeletonLoaderState();
}

class _SkeletonLoaderState extends State<SkeletonLoader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: StaticColors.primary,
        highlightColor: Theme.of(context).colorScheme.tertiary,
        child: const Text(
          'Shimmer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
