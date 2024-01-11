import 'package:display/viewmodels/display.dart';
import 'package:display/viewmodels/main.dart';
import 'package:display/views/config/config.dart';
import 'package:display/views/config/settings.dart';
import 'package:display/views/config/text_list.dart';
import 'package:display/views/display.dart';
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
      DisplayViewModel.route: (context) => const DisplayScreen(),
    };
  }

  /// Name of the initial route for the main navigation.
  String get initialRoute {
    return MainViewModel.route;
  }

  /// Routes of the nested navigator.
  List<Widget> get nestedRoutes => [
        const TextListScreen(),
        const ConfigScreen(),
        const SettingsScreen(),
      ];
}
