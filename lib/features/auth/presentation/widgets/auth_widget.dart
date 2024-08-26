import 'package:bloc_app/features/auth/presentation/pages/sign_in_pages.dart';
import 'package:bloc_app/features/auth/presentation/pages/sign_up_pages.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const AuthWidget({super.key, required this.hintText, required this.controller,this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      obscureText: obscureText,
      validator: (String? value){
        if (value!.isEmpty){
          return '$hintText cant be empty';
        }else {
          return null;
        }
      },
    );
  }
}

// class AuthInPage extends StatelessWidget {
//   final String hintTextt;
//   const AuthInPage({super.key, required this.hintTextt});
//
//   @override
//   Widget build(BuildContext context) {
//     return  TextButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SignInPage()),
//         );
//       },
//       child: Text('Sign In'),
//     );
//   }
// }
//
//
//
// class AuthUpPage extends StatelessWidget {
//   final String hintTextt;
//   const AuthUpPage({super.key, required this.hintTextt});
//
//   @override
//   Widget build(BuildContext context) {
//     return  TextButton(
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SignUpPage()),
//         );
//       },
//       child: Text('Sign Up'),
//     );
//   }
// }