import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:dayliff/features/dashboard/components/route_detail/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouteOrders extends StatelessWidget {
  const RouteOrders({super.key, required this.pool});
  final RoutePool pool;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text(
            //   "${pool.name} orders",
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleMedium!
            //       .copyWith(fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: AppBar().preferredSize.height/2,),
            ListView.separated(
              itemCount: pool.orders.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Name: ",
                        children: [
                          TextSpan(
                              text: pool.orders[index].customerName,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor))
                        ],
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                      text: "Phone: ",
                      children: [
                        TextSpan(
                            text: pool.orders[index].customerPhone,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary))
                      ],
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Colors.black,
                          ),
                    )),
                    RichText(
                        text: TextSpan(
                      text: "To: ",
                      children: [
                        TextSpan(
                            text: '${pool.orders[index].destination?.name}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary))
                      ],
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.black,
                          ),
                    )),
                  ],
                ),
                trailing: InkWell(
                  onTap: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                    // Do the same thing when an icon is tapped
                    context
                        .read<MapsControllerBloc>()
                        .add(MarkerTapped(pool.orders[index]));
                  },
                  child: const CircleAvatar(child: Icon(Icons.chevron_right)),
                ),
              ),
              separatorBuilder: (context, index) => Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
