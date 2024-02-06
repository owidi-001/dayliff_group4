import 'package:dayliff/features/dashboard/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/home.dart';
import 'package:dayliff/features/dashboard/components/landing/landing.dart';
import 'package:dayliff/features/dashboard/components/settings/settings.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final authBloc = context.read<AuthBloc>().state;
    // // Check auth
    // if (authBloc.status == ServiceStatus.initial ||
    //     !authBloc.loginSuccess ||
    //     authBloc.user == null) {
    //   // Return to login
    //   Navigator.of(context).pushReplacement(
    //       MaterialPageRoute(builder: (context) => const Login()));
    // }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: StaticColors.primary,
      ),
    );
    return BlocBuilder<DashboardControllerBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: [
            const Landing(),
            const Home(),
            const Settings()
          ][state.position],
          bottomNavigationBar: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              height: 50,
              backgroundColor: StaticColors.primary,
              selectedIndex: state.position,
              onDestinationSelected: (value) {
                context
                    .read<DashboardControllerBloc>()
                    .add(DashboardEvent(value));
              },
              destinations: [
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.home_filled,
                    color: StaticColors.primary,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: StaticColors.onPrimary,
                  ),
                  label: "Home",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.list_rounded,
                    color: StaticColors.primary,
                  ),
                  icon: Icon(
                    Icons.list_rounded,
                    color: StaticColors.onPrimary,
                  ),
                  label: "Trips",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    Icons.settings,
                    color: StaticColors.primary,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: StaticColors.onPrimary,
                  ),
                  label: "Settings",
                )
              ]),
        );
      },
    );
  }
}
