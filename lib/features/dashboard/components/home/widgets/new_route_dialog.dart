import 'package:dayliff/features/auth/widgets/form.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';

class NewRouteDialog extends StatelessWidget {
  const NewRouteDialog({super.key, required this.trip});
  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Header Image
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 100),
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/dialog_head.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Title
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
              child: Text(
                'New route received',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(),
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              // child: Text(
              //   'Your body content goes here...',
              //   style: TextStyle(fontSize: 16),
              // ),
              child: Table(
                border: TableBorder.all(),
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                },
                children: [
                  _buildTableRow('#Orders', "${trip.orders.length} orders"),
                  _buildTableRow('Distance', "${trip.distance} KM"),
                  _buildTableRow('Duration', "${trip.duration} mins"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: PrimaryButton(
                  hint: "OK",
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label1, String label2) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label2,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
