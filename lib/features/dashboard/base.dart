import 'package:dayliff/features/dashboard/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/home.dart';
import 'package:dayliff/features/dashboard/components/settings/settings.dart';
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
        statusBarColor: Theme.of(context).colorScheme.primary,
      ),
    );
    return BlocBuilder<DashboardControllerBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: [const Home(), const Settings()][state.position],
          bottomNavigationBar: NavigationBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              selectedIndex: state.position,
              onDestinationSelected: (value) {
                context
                    .read<DashboardControllerBloc>()
                    .add(DashboardEvent(value));
              },
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.dashboard),
                  label: "Dashboard",
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                )
              ]),
        );
      },
    );
  }
}
