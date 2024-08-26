import 'package:bloc_app/core/theme/app_palete.dart';
import 'package:flutter/material.dart';

class AuthTextButtonWidget extends StatelessWidget {
  final String textox;
  final Widget screen;
  const AuthTextButtonWidget({super.key, required this.textox, required this.screen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      child: RichText(
        text: TextSpan(
          text: "Don't have an account?   ",
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: AppPallete.whiteColor),
          children: [
            TextSpan(
              text: textox,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppPallete.gradient2),
            )
          ]
        ),
      ),
    );
  }
}
