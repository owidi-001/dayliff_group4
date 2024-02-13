import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';

import 'package:flutter/material.dart';

class CompleteCard extends StatelessWidget {
  const CompleteCard({
    super.key,
  });

  Widget _circle(context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Theme.of(context).disabledColor, width: 2),
      ),
      child: const Icon(
        Icons.circle,
        color: Colors.transparent,
        size: 15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mombasa RD Route",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "PENDING",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppUtility.getStatusColor(
                        OrderStatus.PENDING, context)),
              )
            ],
          ),
          const Divider(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _circle(context),
                  SizedBox(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        16,
                        (index) => index != 8
                            ? Expanded(
                                child: Container(
                                  color: index % 2 == 0
                                      ? Colors.transparent
                                      : Theme.of(context).disabledColor,
                                  height: 1,
                                  width: 2,
                                ),
                              )
                            : Container(
                                height: 10,
                                width: 10,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      color: Theme.of(context).dividerColor,
                                      width: 2),
                                ),
                                child: const Icon(
                                  Icons.circle,
                                  color: Colors.transparent,
                                  size: 8,
                                ),
                              ),
                      ),
                    ),
                  ),
                  // _circle(),
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).disabledColor,
                    size: 28,
                  )
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From:",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      "Donholm",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    // const Spacer(),
                    Text(
                      "Dest:",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      "Warehouse",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
