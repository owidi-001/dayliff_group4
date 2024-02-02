import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({super.key, required this.order});
  final Order order;

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const {
        0: FlexColumnWidth(2), // Adjust the column widths as needed
        1: FlexColumnWidth(3),
      },
      children: [
        TableRow(
          children: [
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Order ID:'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${widget.order.orderId}'),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Customer Name:'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.order.customerName),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Customer Phone:'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.order.customerPhone),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Order Date:'),
              ),
            ),
            TableCell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppUtility.formatDate(widget.order.orderDate)),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            const TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Status:'),
              ),
            ),
            TableCell(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.order.status.toStringValue(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppUtility.getStatusColor(
                          widget.order.status, context),
                    ),
              ),
            )),
          ],
        ),
      ],
    );
  }
}
