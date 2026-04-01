import 'package:flutter/material.dart';

extension SnackbarMessage on BuildContext {
  SnackBarAction _dismissAction() {
    return SnackBarAction(
      label: '',
      onPressed: () => ScaffoldMessenger.of(this).hideCurrentSnackBar(),
    );
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        action: _dismissAction(),
      ),
    );
  }

  void showErrorSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(this).colorScheme.error,
        action: _dismissAction(),
      ),
    );
  }

  void showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(this).colorScheme.primary,
        action: _dismissAction(),
      ),
    );
  }
}
