import 'package:dayliff/dashboard/components/home/home.dart';
import 'package:dayliff/dashboard/components/settings/settings.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int position = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [const Home(), const Settings()][position],
      bottomNavigationBar: NavigationBar(
          selectedIndex: position,
          onDestinationSelected: (value) {
            setState(() {
              position = value;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            NavigationDestination(icon: Icon(Icons.settings), label: "Settings")
          ]),
    );
  }
}
