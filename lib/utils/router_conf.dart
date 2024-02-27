import 'package:dayliff/data/repository/auth_repository.dart';
import 'package:dayliff/features/auth/login.dart';
import 'package:dayliff/features/auth/welcome.dart';
import 'package:dayliff/features/dashboard/base.dart';
import 'package:dayliff/features/dashboard/components/settings/settings.dart';
import 'package:dayliff/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream stream) {
    stream.listen(
      (value) {
        notifyListeners();
      },
    );
  }
}

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: rootNavigator,
  refreshListenable:
      GoRouterRefreshStream(AuthenticationRepository.instance.stream),
  redirect: (context, state) {
    String loc = state.matchedLocation;
    bool isAuthenticated = AuthenticationRepository.instance.status ==
        AuthenticationStatus.authenticated;

    if (isAuthenticated &&
        (loc.contains("login") ||
            loc.contains("splash") ||
            loc.contains("welcome"))) {
      return state.namedLocation("dashboard");
    }
    if (!isAuthenticated &&
        !(loc.contains("login") ||
            loc.contains("splash") ||
            loc.contains("welcome"))) {
      return state.namedLocation("login");
    }
    return null;
  },
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      name: "splash",
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const Splash();
      },
    ),
    GoRoute(
      name: "welcome",
      path: '/welcome',
      builder: (BuildContext context, GoRouterState state) {
        return const Welcome();
      },
    ),
    GoRoute(
      name: "login",
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
      routes: <RouteBase>[
        GoRoute(
          name: "dashboard",
          path: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const Dashboard();
          },
        ),
        GoRoute(
          name: "settings",
          path: 'settings',
          builder: (BuildContext context, GoRouterState state) {
            return const Settings();
          },
        ),
      ],
    ),
  ],
);
