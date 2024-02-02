import 'package:dayliff/features/auth/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/bloc/bloc.dart';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/route_detail/bloc/bloc.dart';
import 'package:dayliff/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  setUpService();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final orderBloc = OrderBloc();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => DashboardControllerBloc()),
          BlocProvider(create: (context) => MapsControllerBloc()),
          BlocProvider(create: (context) => orderBloc),
          BlocProvider(create: (context) => CheckOutBloc(orderBloc))
        ],
        child: MaterialApp(
          title: 'Dayliff cargoflow',
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   colorScheme:
          //       ColorScheme.fromSeed(seedColor: const Color(0xff0082d6)),
          //   useMaterial3: true,
          // ),
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xff0082d6)),
            primaryColor: const Color(0xff0082d6),
            appBarTheme: AppBarTheme(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Color(0xff0082d6),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: Theme.of(context).colorScheme.primary,
              textTheme: ButtonTextTheme.primary,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  Color(0xff0082d6),
                ),
                foregroundColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.onPrimary,
                ),
                // shape: MaterialStatePropertyAll(
                //   RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                // ),
              ),
            ),
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: Theme.of(context).colorScheme.primary,
              labelTextStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          home: const Splash(),
        ));
  }
}
