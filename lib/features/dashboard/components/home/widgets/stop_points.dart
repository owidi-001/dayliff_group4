import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class StopPointsWidget extends StatelessWidget {
  final List<String> stopPoints;

  const StopPointsWidget({super.key, required this.stopPoints});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildStopPoint('Origin', stopPoints.first, isFirst: true),
        for (int i = 1; i < stopPoints.length - 1; i++)
          _buildStopPoint('Stop $i', stopPoints[i]),
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
          margin: const EdgeInsets.only(left: 24),
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
      return Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 2),
        ),
        child: const Icon(
          Icons.circle,
          color: Colors.transparent,
          size: 8,
        ),
      ); // Default circle icon for intermediate stops
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

class StopsWidget extends StatefulWidget {
  StopsWidget({super.key});

  @override
  State<StopsWidget> createState() => _StopsWidgetState();
}

class _StopsWidgetState extends State<StopsWidget> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EasyStepper(
            showTitle: false,
            activeStep: activeStep,
            direction: Axis.vertical,
            stepShape: StepShape.circle,
            borderThickness: 2,
            stepRadius: 8,
            finishedStepBorderColor: Colors.deepOrange,
            finishedStepTextColor: const Color.fromARGB(255, 95, 78, 73),
            finishedStepBackgroundColor: Colors.deepOrange,
            activeStepIconColor: Colors.deepOrange,
            showLoadingAnimation: false,
            steps: [
              EasyStep(
                customStep: ClipOval(
                  child: Opacity(
                    opacity: activeStep >= 0 ? 1 : 0.3,
                    child: Image.asset('assets/1.png'),
                  ),
                ),
                customTitle: const Text(
                  'Dash 1',
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: ClipOval(
                  child: Opacity(
                    opacity: activeStep >= 1 ? 1 : 0.3,
                    child: Image.asset('assets/2.png'),
                  ),
                ),
                customTitle: const Text(
                  'Dash 2',
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: ClipOval(
                  child: Opacity(
                    opacity: activeStep >= 2 ? 1 : 0.3,
                    child: Image.asset('assets/3.png'),
                  ),
                ),
                customTitle: const Text(
                  'Dash 3',
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: ClipOval(
                  child: Opacity(
                    opacity: activeStep >= 3 ? 1 : 0.3,
                    child: Image.asset('assets/4.png'),
                  ),
                ),
                customTitle: const Text(
                  'Dash 4',
                  textAlign: TextAlign.center,
                ),
              ),
              EasyStep(
                customStep: ClipOval(
                  child: Opacity(
                    opacity: activeStep >= 4 ? 1 : 0.3,
                    child: Image.asset('assets/5.png'),
                  ),
                ),
                customTitle: const Text(
                  'Dash 5',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
            onStepReached: (index) => setState(() => activeStep = index),
          ),
        ],
      ),
    );
  }
}
