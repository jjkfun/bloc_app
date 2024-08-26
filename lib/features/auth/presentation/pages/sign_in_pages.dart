import 'package:bloc_app/core/common/widgets/loader.dart';
import 'package:bloc_app/core/error/failure.dart';
import 'package:bloc_app/core/utils/show_sneak_bar.dart';
import 'package:bloc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_app/features/auth/presentation/pages/sign_up_pages.dart';
import 'package:bloc_app/features/auth/presentation/widgets/auth_widget.dart';
import 'package:bloc_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/auth_el_button_widget.dart';
import '../widgets/auth_text_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure){
            return showSneakBar(context, state.message);
          }
          if (state is AuthSuccess){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading){
            return const LoaderWidget();
          }
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sign in.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50),
                  ),
                  const SizedBox(height: 35,),
                  AuthWidget(hintText: 'Email', controller: emailController,),
                  const SizedBox(height: 10,),
                  AuthWidget(
                    hintText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
                  const SizedBox(height: 25,),
                  AuthElButtonWidget(text: 'Sign in', onPressed: () {
                    if (formKey.currentState!.validate()){
                      context.read<AuthBloc>().add(AuthSignIn(password: emailController.text, email: passwordController.text));
                    }
                  }),
                  const SizedBox(height: 25,),
                  const AuthTextButtonWidget(
                    textox: 'Sign in', screen: SignUpPage(),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
