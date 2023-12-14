import 'package:flutter/material.dart';

/// Filter class including one text filter.
class Filter extends ChangeNotifier {
  /// The actual entered text of this filter.
  String? _textFilter;

  /// Returns the actual saved filter text.
  String? get textFilter => _textFilter;

  /// Updates the [textFilter].
  set textFilter(String? textFilter) {
    _textFilter = textFilter;
    notifyListeners();
  }
}
