

import 'package:bloc_app/core/theme/app_palete.dart';
import 'package:flutter/material.dart';

class AuthElButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthElButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            AppPallete.gradient1,
            AppPallete.gradient2,
          ]),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppPallete.transparentColor,
              shadowColor: AppPallete.transparentColor),
          child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600,fontSize:20,color: AppPallete.whiteColor),),
        ));
  }
}
