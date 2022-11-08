import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      content: Text(
        text,
        style: TextStyle(fontSize: 14),
      ),
    ),
  );
}
