import 'package:display/services/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/display_localizations.dart';

/// View model for the main screen.
class MainViewModel extends ChangeNotifier {
  /// Route of the main screen.
  static String route = '/';

  late BuildContext _context;

  /// Locales of the app.
  late AppLocalizations locales;

  /// Index of the currently selected route.
  int _selectedIndex = 0;

  /// Initializes the view model.
  Future<bool> init(BuildContext context) async {
    _context = context;
    locales = AppLocalizations.of(_context)!;

    return Future<bool>.microtask(() async {
      return true;
    });
  }

  /// Sets the actual screens [index] as selected.
  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  /// Returns index of the actual selected page.
  int get selectedIndex {
    return _selectedIndex;
  }

  /// Loads the selected page of the navigation.
  void loadPage() {
    // Get the nested navigator state to change the nested route.
    NavigatorState? state;
    _context.visitChildElements((element) {
      element.visitChildElements((element) {
        element.visitChildElements((element) {
          element.visitChildElements((element) {
            if (element.widget is Navigator) {
              state = (element as StatefulElement).state as NavigatorState;
            }
          });
        });
      });
    });

    var routeService = RouterService.getInstance();
    var route = routeService.nestedRoutes.keys.elementAt(_selectedIndex);
    state?.pushReplacementNamed(route);
  }
}
