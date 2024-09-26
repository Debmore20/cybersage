import 'package:cybersage/data/BLoC/bloc_exports.dart';
import 'package:cybersage/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBtn extends StatelessWidget {
  final dynamic formKey;

  final dynamic emailController;

  final dynamic passwordController;

  const LoginBtn(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
          isDarkMode ? DarkModeColors.button : LightModeColors.button,
        )),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<AuthBloc>().add(
                  AuthLoginEvent(
                      email: emailController.text,
                      password: passwordController.text),
                );
          }
        },
        child: Text(
          'Log In',
          style: TextStyle(
              color: isDarkMode ? LightModeColors.text2 : DarkModeColors.text2),
        ),
      ),
    );
  }
}
