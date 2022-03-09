import 'package:flutter/material.dart';

class ShowDeleteSnackbar {
  static void showSnackbar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.red[600],
        content: Text(text),
      ));
}

class ShowCompliteSnackbar {
  static void showSnackbar(BuildContext context, String text) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.green,
        content: Text(text),
      ));
}
