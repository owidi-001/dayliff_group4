import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyListWidget extends StatelessWidget {
  final VoidCallback onRefresh;
  final String description;

  const EmptyListWidget(
      {super.key, required this.onRefresh, required this.description});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Illustrator image
          Padding(
            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
            child: SvgPicture.asset(
              "assets/illustrations/empty.svg",
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(height: 20),
          // Text indicating empty list
          Text(
            description,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          // Refresh button
          ElevatedButton(
            onPressed: onRefresh,
            child: const Text('Refresh'),
          ),
        ],
      ),
    );
  }
}
