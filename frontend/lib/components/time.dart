import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:intl/intl.dart';

class TimeComponent extends StatefulWidget {
  final double textSize;

  final Color textColor;

  final bool showSeconds;

  final bool isAnalog;

  const TimeComponent({
    required this.textSize,
    required this.textColor,
    this.showSeconds = false,
    this.isAnalog = false,
    super.key,
  });

  @override
  State<TimeComponent> createState() => _TimeComponentState();
}

class _TimeComponentState extends State<TimeComponent> {
  DateTime _actualTime = DateTime.now();
  late String _formattedTime;

  @override
  void initState() {
    super.initState();
    _formattedTime = DateFormat(
      'hh:mm${widget.showSeconds ? ":ss" : ""}',
    ).format(
      _actualTime,
    );
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _update(),
    );
  }

  void _update() {
    setState(
      () {
        _actualTime = DateTime.now();
        _formattedTime = DateFormat(
          'hh:mm${widget.showSeconds ? ":ss" : ""}',
        ).format(
          _actualTime,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isAnalog
        ? const AnalogClock.dark()
        : Text(
            style: TextStyle(
              color: widget.textColor,
              fontSize: widget.textSize,
              fontWeight: FontWeight.bold,
            ),
            _formattedTime,
          );
  }
}
