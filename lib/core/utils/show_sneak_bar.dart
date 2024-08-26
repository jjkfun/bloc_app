import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSneakBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}
