import 'package:dayliff/features/auth/bloc/bloc.dart';

import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/bloc/bloc.dart';
import 'package:dayliff/splash.dart';
import 'package:dayliff/utils/constants.dart';
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
                backgroundColor: StaticColors.primary,
                foregroundColor: StaticColors.onPrimary),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: Color(0xff0082d6),
            ),
            buttonTheme: ButtonThemeData(
              buttonColor: StaticColors.primary,
              textTheme: ButtonTextTheme.primary,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(
                  Color(0xff0082d6),
                ),
                foregroundColor: MaterialStatePropertyAll(
                  StaticColors.onPrimary,
                ),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            navigationBarTheme: NavigationBarThemeData(
              backgroundColor: StaticColors.primary,
              labelTextStyle: MaterialStatePropertyAll(
                TextStyle(
                  color: StaticColors.onPrimary,
                ),
              ),
            ),
          ),
          home: const Splash(),
        ));
  }
}
