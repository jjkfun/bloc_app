import 'package:bloc_app/core/theme/app_palete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppTheme {

  static border([Color color = AppPallete.borderColor]){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:  BorderSide(color: color,width: 2),
    );
  }
  final darkTheme = ThemeData.dark().copyWith(
    appBarTheme:const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor
    ),
    chipTheme: const ChipThemeData(
      color: WidgetStatePropertyAll(AppPallete.backgroundColor),
      side: BorderSide.none
    ),
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      enabledBorder: border(),
      focusedBorder: border(AppPallete.gradient2),
    ),
  );
}