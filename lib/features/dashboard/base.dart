import 'package:dayliff/bloc/dashboard/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/home.dart';
import 'package:dayliff/features/dashboard/components/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardControllerBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: [const Home(), const Settings()][state.position],
          bottomNavigationBar: NavigationBar(
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
                    icon: Icon(Icons.settings), label: "Settings")
              ]),
        );
      },
    );
  }
}
