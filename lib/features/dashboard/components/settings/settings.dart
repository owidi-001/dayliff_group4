import 'package:dayliff/features/dashboard/components/settings/widgets/settings_tabs.dart';
import 'package:dayliff/utils/info_messages.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // background image and bottom contents
            Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  color: Theme.of(context).colorScheme.primary.withOpacity(.4),
                  // child: const Placeholder(),
                ),
                Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppBar().preferredSize.height * 1.5,
                        ),
                        SectionContainer(
                          title: "Account",
                          children: [
                            SettingsTabs(
                              text: "Update details",
                              icon: Icons.person,
                              press: () {
                                showInfo("Coming soon");
                              },
                            ),
                          ],
                        ),
                        SectionContainer(title: "Orders", children: [
                          SettingsTabs(
                            text: "Active Orders",
                            icon: Icons.card_giftcard_sharp,
                            press: () {
                              showInfo("Coming soon");
                            },
                          ),
                          SettingsTabs(
                            text: "Pending Orders",
                            icon: Icons.pending,
                            press: () {
                              showInfo("Coming soon");
                            },
                          ),
                          SettingsTabs(
                            text: "Completed Orders",
                            icon: Icons.check_circle,
                            press: () {
                              showInfo("Coming soon");
                            },
                          ),
                        ]),
                        SectionContainer(title: "Security", children: [
                          SettingsTabs(
                            text: "Use biometrics",
                            icon: Icons.fingerprint,
                            press: () {
                              showInfo("Coming soon");
                            },
                            isSwitch: true,
                          ),
                        ]),
                        SizedBox(
                          height: AppBar().preferredSize.height,
                        ),
                      ],
                    ))
              ],
            ),
            // Profile image
            const Positioned(
              top: 130.0, // (background container size) - (circle height / 2)
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/avatar.jpeg"),
                radius: 70.0,
              ),
              // Container(
              //   height: 100.0,
              //   width: 100.0,
              //   decoration:
              //       BoxDecoration(shape: BoxShape.circle, color: Colors.green),
              // ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionContainer extends StatelessWidget {
  const SectionContainer(
      {super.key, required this.children, required this.title});
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children),
          ),
        ],
      ),
    );
  }
}
