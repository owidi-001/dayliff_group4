import 'package:dayliff/bloc/auth/bloc.dart';
import 'package:dayliff/bloc/dashboard/bloc.dart';
import 'package:dayliff/bloc/maps/bloc.dart';
import 'package:dayliff/bloc/order/bloc.dart';
import 'package:dayliff/bloc/order_confirmation/bloc.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => DashboardControllerBloc()),
          BlocProvider(create: (context) => MapsControllerBloc()),
          BlocProvider(create: (context) => OrderBloc()),
          BlocProvider(create: (context) => OrderConfirmationBloc())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const Splash(),
          builder: EasyLoading.init(),
        ));
  }
}
