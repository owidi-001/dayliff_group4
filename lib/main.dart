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
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const Splash(),
        ));
  }
}
