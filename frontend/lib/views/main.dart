import 'package:display/viewmodels/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Main view with nested navigation element.
class MainScreen extends StatelessWidget {
  /// Initializes the instance.
  const MainScreen({super.key});

  /// Builds the main screen with the navigator instance.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainViewModel>(
      create: (context) => MainViewModel(),
      builder: (context, _) {
        var vm = Provider.of<MainViewModel>(context, listen: false);

        return FutureBuilder(
          future: vm.init(context),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Scaffold(
              body: Consumer<MainViewModel>(
                builder: (context, vm, _) {
                  return vm.getBody();
                },
              ),
              bottomNavigationBar: Consumer<MainViewModel>(
                builder: (context, vm, _) {
                  return BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    currentIndex: vm.selectedIndex,
                    backgroundColor: BottomAppBarTheme.of(context).color,
                    showUnselectedLabels: false,
                    showSelectedLabels: true,
                    items: [
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.translate),
                        label: vm.locales.text,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.display_settings),
                        label: vm.locales.display_config,
                      ),
                      BottomNavigationBarItem(
                        icon: const Icon(Icons.settings),
                        label: vm.locales.settings,
                      ),
                    ],
                    onTap: (int index) {
                      vm.selectedIndex = index;
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
