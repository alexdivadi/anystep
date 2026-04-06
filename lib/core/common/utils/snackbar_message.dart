import 'package:flutter/material.dart';

extension SnackbarMessage on BuildContext {
  static const Duration _defaultSnackBarDuration = Duration(seconds: 4);

  SnackBarAction _dismissAction() {
    return SnackBarAction(
      label: MaterialLocalizations.of(this).closeButtonLabel,
      onPressed: () => ScaffoldMessenger.of(this).hideCurrentSnackBar(),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        action: _dismissAction(),
        duration: _defaultSnackBarDuration,
      ),
    );
  }

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(this).colorScheme.error,
        action: _dismissAction(),
        duration: _defaultSnackBarDuration,
      ),
    );
  }

  void showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(this).colorScheme.primary,
        action: _dismissAction(),
        duration: _defaultSnackBarDuration,
      ),
    );
  }
}
