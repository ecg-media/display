import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateComponent extends StatefulWidget {
  final double textSize;

  final Color textColor;

  const DateComponent({
    required this.textSize,
    required this.textColor,
    super.key,
  });

  @override
  State<DateComponent> createState() => _DateComponentState();
}

class _DateComponentState extends State<DateComponent> {
  DateTime _actualDate = DateTime.now();
  late String _formattedDate;

  @override
  void initState() {
    super.initState();
    _formattedDate = DateFormat('dd.MM.yyyy').format(_actualDate);
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _update(),
    );
  }

  void _update() {
    if (DateUtils.isSameDay(_actualDate, DateTime.now())) {
      return;
    }
    setState(() {
      _actualDate = DateTime.now();
      _formattedDate = DateFormat('dd.MM.yyyy').format(_actualDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      style: TextStyle(
        color: widget.textColor,
        fontSize: widget.textSize,
        fontWeight: FontWeight.bold,
      ),
      _formattedDate,
    );
  }
}
