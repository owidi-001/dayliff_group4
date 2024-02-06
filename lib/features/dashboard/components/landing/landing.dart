import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade400,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.sizeOf(context).height / 2) -
                  AppBar().preferredSize.height,
              child: Stack(children: [
                Container(
                  height: (MediaQuery.sizeOf(context).height / 2) -
                      (AppBar().preferredSize.height * 1.6),
                  decoration: BoxDecoration(
                    color: StaticColors.primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.sizeOf(context).height / 2) -
                      (AppBar().preferredSize.height * 1.8),
                  decoration: BoxDecoration(
                    color: StaticColors.onPrimary.withOpacity(.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.sizeOf(context).height / 2) -
                      (AppBar().preferredSize.height * 2.0),
                  decoration: BoxDecoration(
                    color: StaticColors.onPrimary.withOpacity(.5),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
                Container(
                  height: (MediaQuery.sizeOf(context).height / 2) -
                      (AppBar().preferredSize.height * 2.2),
                  decoration: BoxDecoration(
                    color: StaticColors.primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: StaticColors.primary.withOpacity(.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: ((context, index) => AnimateInEffect(
                    keepAlive: true,
                    intervalStart: index / 5,
                    child: Container(
                      decoration: BoxDecoration(
                          color: StaticColors.primary.withOpacity(.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: const ListTile(
                        title: Text("Order number"),
                        subtitle: Text("To location"),
                        trailing: Text("20 items"),
                      ),
                    ),
                  )),
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.transparent),
            ),
            SizedBox(
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }
}
