import 'package:display/components/date.dart';
import 'package:display/components/time.dart';
import 'package:flutter/material.dart';

/// Overview screen of the display configuration
class DisplayScreen extends StatelessWidget {
  /// Initializes the instance.
  const DisplayScreen({super.key});

  /// Builds the records overview screen.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: TimeComponent(
          textSize: 48,
          textColor: Colors.red,
          showSeconds: true,
          isAnalog: true,
        ),
      ),
    );
  }
}
