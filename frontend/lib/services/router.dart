import 'package:display/viewmodels/config/config.dart';
import 'package:display/viewmodels/config/settings.dart';
import 'package:display/viewmodels/main.dart';
import 'package:display/views/config/config.dart';
import 'package:display/views/config/settings.dart';
import 'package:display/views/main.dart';
import 'package:flutter/material.dart';

/// Service that holds all routing information of the navigators of the app.
class RouterService {
  /// Instance of the router service.
  static final RouterService _instance = RouterService._();

  /// GlobalKey of the state of the main navigator.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// Private constructor of the service.
  RouterService._();

  /// Returns the singleton instance of the [RouterService].
  static RouterService getInstance() {
    return _instance;
  }

  /// Routes of the main navigator.
  Map<String, Widget Function(BuildContext)> get routes {
    return {
      MainViewModel.route: (context) => const MainScreen(),
    };
  }

  /// Name of the initial route for the main navigation.
  String get initialRoute {
    return MainViewModel.route;
  }

  /// Routes of the nested navigator.
  Map<String, Route<dynamic>?> get nestedRoutes {
    return {
       ConfigViewModel.route: PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const ConfigScreen(),
        transitionDuration: const Duration(seconds: 0),
      ),
       SettingsViewModel.route: PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => const SettingsScreen(),
        transitionDuration: const Duration(seconds: 0),
      ),
    };
  }
}
