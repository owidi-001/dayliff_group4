
import 'package:dayliff/data/local/local.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/auth/login.dart';
import 'package:dayliff/features/dashboard/components/settings/widgets/settings_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                                // showInfo("Coming soon");
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Coming soon")));
                              },
                            ),
                            SettingsTabs(
                              text: "Log out",
                              icon: Icons.logout,
                              press: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Container(
                                            constraints: const BoxConstraints(
                                                minHeight: 150),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "Confirm Log out?",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                const Text(
                                                    "Are you sure you want to log out?"),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: TextButton(
                                                      child:
                                                          const Text("Cancel"),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    )),
                                                    Expanded(
                                                        child: TextButton(
                                                      child:
                                                          const Text("Log out"),
                                                      onPressed: () {
                                                        // Remove dialog
                                                        Navigator.of(
                                                                context)
                                                            .pop();
                                                        // Redirect to login
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                const Login(),
                                                          ),
                                                        );
                                                        // Clear details
                                                        context
                                                            .read<AuthBloc>()
                                                            .add(LogoutEvent());
                                                      },
                                                    ))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ));
                                // showInfo("Coming soon");
                                // ScaffoldMessenger.of(context).showSnackBar(
                                // const SnackBar(
                                //     content: Text("Coming soon")));
                              },
                            ),
                          ],
                        ),
                        SectionContainer(title: "Orders", children: [
                          SettingsTabs(
                            text: "Active Orders",
                            icon: Icons.card_giftcard_sharp,
                            press: () {
                              // showInfo("Coming soon");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Coming soon")));
                            },
                          ),
                          SettingsTabs(
                            text: "Pending Orders",
                            icon: Icons.pending,
                            press: () {
                              // showInfo("Coming soon");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Coming soon")));
                            },
                          ),
                          SettingsTabs(
                            text: "Completed Orders",
                            icon: Icons.check_circle,
                            press: () {
                              // showInfo("Coming soon");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Coming soon")));
                            },
                          ),
                        ]),
                        SectionContainer(title: "Security", children: [
                          SettingsTabs(
                            text: "Use biometrics",
                            icon: Icons.fingerprint,
                            press: () {
                              // showInfo("Coming soon");
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Coming soon")));
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
            ),
            Positioned(
              top: AppBar().preferredSize.height,
              left: 16,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Text(
                    AppUtility.capitalize(state.user?.name ?? ''),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  );
                },
              ),
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
