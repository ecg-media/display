import 'package:display/services/router.dart';
import 'package:display/viewmodels/config/config.dart';
import 'package:display/viewmodels/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

/// Main view with nested navigation element.
class MainScreen extends StatelessWidget {
  /// Initializes the instance.
  const MainScreen({Key? key}) : super(key: key);

  /// Builds the main screen with the navigator instance.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MainViewModel>(
        create: (context) => MainViewModel(),
        builder: (context, _) {
          var vm = Provider.of<MainViewModel>(context, listen: false);

          return FutureBuilder(
            future: vm.init(context),
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              return Row(
                children: [
                  Stack(
                    children: [
                      Consumer<MainViewModel>(
                        builder: (context, vm, _) {
                          return NavigationRail(
                            selectedIndex: vm.selectedIndex,
                            onDestinationSelected: (int index) {
                              if (index == vm.selectedIndex) {
                                return;
                              }
                              vm.selectedIndex = index;
                              vm.loadPage();
                            },
                            labelType: NavigationRailLabelType.all,
                            destinations: [
                              _navItem(
                                Icons.display_settings,
                                vm.locales.display_config,
                              ),
                              _navItem(
                                Icons.settings,
                                vm.locales.settings,
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Navigator(
                      initialRoute: ConfigViewModel.route,
                      onGenerateRoute: (settings) {
                        return RouterService.getInstance().nestedRoutes[settings.name];
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  /// Returns a new navigation rail destination with the given
  /// [label] and [icon].
  NavigationRailDestination _navItem(IconData icon, String label) {
    return NavigationRailDestination(
      icon: Icon(icon),
      label: Text(label),
    );
  }
}
