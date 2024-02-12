import 'dart:async';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';

class CountUpTimer extends StatefulWidget {
  const CountUpTimer({super.key});

  @override
  State<CountUpTimer> createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer> {
  late Timer _timer;
  int _elapsedSeconds = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Handover Time: ${_formatDuration(_elapsedSeconds)}',
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: StaticColors.onPrimary),
    );
  }
}
