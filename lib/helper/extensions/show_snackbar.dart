import 'package:flutter/material.dart';

extension ShowAlerts on String {
  showSnackBar(BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(this),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ));
  }
}
