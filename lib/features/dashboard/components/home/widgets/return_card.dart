import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/dashboard/components/home/models/route/route.dart';
import 'package:flutter/material.dart';

class ReturnCard extends StatelessWidget {
  const ReturnCard({
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
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
                    height: 100,
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
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      "Donholm",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(
                      height: 80,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: 16,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) => Icon(
                                        Icons.circle,
                                        size: 5,
                                        color: index % 2 == 0
                                            ? Colors.transparent
                                            : Colors.transparent,
                                      )),
                            ),
                          ]),
                    ),
                    Text(
                      "Dest:",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      "Warehouse",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // TODO! snack messages
                  // showInfo("Return feature coming soon");
                },
                child: const CircleAvatar(
                  child: Icon(Icons.chevron_right),
                ),
              )
            ],
          ),
          // const Divider(),
          ExpansionTile(
            title: Text(
              "Return reason",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            tilePadding: EdgeInsets.zero,
            children: [
              Text(
                dummy,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}

const dummy =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
