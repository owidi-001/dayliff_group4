import 'dart:math';

import 'package:flutter/material.dart';

class SineWaveAnimation extends StatefulWidget {
  const SineWaveAnimation({super.key});

  @override
  _SineWaveAnimationState createState() => _SineWaveAnimationState();
}

class _SineWaveAnimationState extends State<SineWaveAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(300, 200),
        painter: SineWavePainter(_animation.value),
      ),
    );
  }
}

class SineWavePainter extends CustomPainter {
  final double animationValue;

  SineWavePainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final wavePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    const amplitude = 40;
    final frequency = 2 * 3.14159 / size.width;
    final offset = size.height / 2;

    for (double x = 0; x <= size.width; x += 1) {
      final y = offset + amplitude * sin(frequency * x) * animationValue;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, wavePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
