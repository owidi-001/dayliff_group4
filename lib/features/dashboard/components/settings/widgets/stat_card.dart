import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';

class StatCard extends StatefulWidget {
  final String label;
  final int value;
  final int finalValue;
  final Color? color;

  const StatCard(
      {super.key,
      required this.label,
      required this.value,
      required this.finalValue,
      this.color});

  @override
  State<StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<StatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = IntTween(begin: widget.value, end: widget.finalValue)
        .animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: widget.color ?? StaticColors.primary.withOpacity(.1),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Text(
                  _animation.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 32, color: StaticColors.primary),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
