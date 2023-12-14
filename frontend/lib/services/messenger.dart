import 'package:flutter/material.dart';

/// Service that shows messages in the snackbar of the app.
class MessengerService {
  /// Instance of the messenger service.
  static final MessengerService _instance = MessengerService._();

  /// Global key to access the state of the snackbar.
  final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey();

  /// Private constructor of the service.
  MessengerService._();

  /// Returns the singleton instance of the [MessengerService].
  static MessengerService getInstance() {
    return _instance;
  }

  /// Shows the given [text] in the app snackbar.
  showMessage(String text) {
    final SnackBar snackBar = SnackBar(content: Text(text));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
