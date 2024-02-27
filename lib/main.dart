import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/data/repository/location_repository.dart';
import 'package:dayliff/features/auth/auth_bloc/bloc.dart';
import 'package:dayliff/data/service/service.dart';
import 'package:dayliff/features/dashboard/components/checkout/checkout_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/home/order_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/settings/settings_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/processing_bloc/bloc.dart';
import 'package:dayliff/features/dashboard/components/trip_detail/widgets/maps_bloc/bloc.dart';
import 'package:dayliff/utils/constants.dart';
import 'package:dayliff/utils/router_conf.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  setUpService();
  await dotenv.load(fileName: ".env");

  debugDefaultTargetPlatformOverride = TargetPlatform.android;

  kNotificationSlideDuration = const Duration(milliseconds: 500);
  kNotificationDuration = const Duration(milliseconds: 1500);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => LocationStreamer.instance,
        ),
        RepositoryProvider(
          create: (context) => AuthenticationRepository.instance,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final orderBloc = OrderBloc();
    final checkoutBloc = CheckOutBloc();
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => orderBloc),
          BlocProvider(create: (context) => SettingsBloc()),
          BlocProvider(
              create: (context) => ProcessingCubit(
                  orderBloc, checkoutBloc, LocationStreamer.instance)),
          BlocProvider(create: (context) => MapsControllerBloc()),
          BlocProvider(create: (context) => checkoutBloc)
        ],
        child: OverlaySupport.global(
          child: MaterialApp.router(
            title: 'Dayliff cargoflow',
            debugShowCheckedModeBanner: false,
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
            routerConfig: router,
          ),
        ));
  }
}
