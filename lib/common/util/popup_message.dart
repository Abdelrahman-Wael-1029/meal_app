import 'package:flutter/material.dart';

void popUpMessage(
    {required context, required String message, Color? background}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: background,
    ),
  );
}
