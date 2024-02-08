import 'package:flutter/material.dart';

class StopPointsWidget extends StatelessWidget {
  final List<String> stopPoints;

  StopPointsWidget({required this.stopPoints});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStopPoint('Origin', stopPoints.first, isFirst: true),
        for (int i = 1; i < stopPoints.length - 1; i++)
          _buildStopPoint('Stop ${i}', stopPoints[i]),
        _buildStopPoint("Destination", stopPoints.last, isLast: true),
      ],
    );
  }

  Widget _buildStopPoint(
    String label,
    String location, {
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(location),
          leading: _buildIcon(isFirst: isFirst, isLast: isLast),
        ),
        Container(
          margin: const EdgeInsets.only(left: 28),
          height: isLast ? 0 : 20, // Adjust spacing at the end
          child: Container(
            width: 2,
            color: Colors.grey.withOpacity(0.5),
            child: CustomPaint(
              painter: DottedLinePainter(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon({bool isFirst = false, bool isLast = false}) {
    if (isFirst) {
      return const Icon(Icons.directions_bus); // Start icon
    } else if (isLast) {
      return const Icon(Icons.location_on); // Destination icon
    } else {
      return const Icon(
          Icons.circle); // Default circle icon for intermediate stops
    }
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const double dashWidth = 5;
    const double dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
