import 'package:flutter/material.dart';

class SnackbarManager {
  static final SnackbarManager _instance = SnackbarManager._internal();
  factory SnackbarManager() => _instance;

  SnackbarManager._internal();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void showErrorSnackbar(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  void showSuccessSnackbar(String message) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}
