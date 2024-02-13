import 'dart:convert';

import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/auth/login.dart';
import 'package:dayliff/features/dashboard/components/settings/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/settings/widgets/password_change.dart';
import 'package:dayliff/features/dashboard/components/settings/widgets/settings_tabs.dart';
import 'package:dayliff/features/dashboard/components/settings/widgets/update_form.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                  color: StaticColors.primary,
                  // child: const Placeholder(),
                ),
                Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: AppBar().preferredSize.height * 1.5,
                        ),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return SectionContainer(
                                title: "Account",
                                children: [
                                  SettingsTabs(
                                      text: "${state.user?.name}",
                                      icon: Icons.person,
                                      press: null),
                                  SettingsTabs(
                                      text: "${state.user?.email}",
                                      icon: Icons.email,
                                      press: null),
                                  SettingsTabs(
                                      text: "${state.user?.phoneNumber}",
                                      icon: Icons.phone,
                                      press: null),
                                ]);
                          },
                        ),
                        AnimateInEffect(
                          keepAlive: true,
                          intervalStart: 0,
                          child: SectionContainer(
                            title: "Security",
                            children: [
                              SettingsTabs(
                                text: "Change Password",
                                icon: FontAwesomeIcons.lock,
                                press: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const PasswordChangeForm());
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
                                                                FontWeight
                                                                    .bold),
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
                                                        child: const Text(
                                                            "Cancel"),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      )),
                                                      Expanded(
                                                          child: TextButton(
                                                        child: const Text(
                                                            "Log out"),
                                                        onPressed: () {
                                                          // Remove dialog
                                                          Navigator.of(context)
                                                              .pop();
                                                          // Clear logins
                                                          AuthenticationRepository
                                                              .instance
                                                              .logout();
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
                                                              .add(
                                                                  LogoutEvent());
                                                        },
                                                      ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ));
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppBar().preferredSize.height,
                        ),
                      ],
                    ))
              ],
            ),
            // Profile image
            Positioned(
              top: 130.0, // (background container size) - (circle height / 2)
              child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
                  return Stack(
                    children: [
                      buildProfileImage(state),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            child: IconButton(
                              onPressed: () {
                                // showModalBottomSheet(
                                //     context: context,
                                //     builder: (context) => Container(
                                //           padding: const EdgeInsets.all(8),
                                //           child: Column(
                                //             mainAxisSize: MainAxisSize.min,
                                //             children: [
                                //               TextButton.icon(
                                //                   icon: const Icon(
                                //                       FontAwesomeIcons.camera),
                                //                   onPressed: () {
                                //                     Navigator.of(context).pop();
                                //                   },
                                //                   label: const Text(
                                //                       "Change profile picture"))
                                //             ],
                                //           ),
                                //         ));

                                // Dispatch event to change profile picture
                                context
                                    .read<SettingsBloc>()
                                    .add(ChangeProfilePic());
                              },
                              icon: Icon(
                                FontAwesomeIcons.camera,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Positioned(
              top: AppBar().preferredSize.height,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            Positioned(
              top: AppBar().preferredSize.height / 1.2,
              right: 16,
              child: IconButton.filled(
                onPressed: () {
                  // showDialog(
                  //     useRootNavigator: true,
                  //     context: context,
                  //     builder: (context) {
                  //       return const UpdateProfileDialog();
                  //     });
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const UpdateProfileDialog();
                      });
                },
                icon: const Icon(Icons.edit),
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
              color: StaticColors.onPrimary,
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

Widget buildProfileImage(SettingsState state) {
  if (state.profilePicture != null) {
    return CircleAvatar(
      backgroundImage: MemoryImage(
        Uint8List.fromList(base64Decode(state.profilePicture!)),
      ),
      radius: 70.0,
    );
  } else {
    return const CircleAvatar(
      backgroundImage: AssetImage("assets/avatar.jpg"),
      radius: 70.0,
    );
  }
}
