import 'package:cybersage/presentation/Components/Profile/Pages/login_page.dart';
import 'package:cybersage/presentation/Components/Profile/Pages/signup_page.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class UnauthenticatedUser extends StatelessWidget {
  const UnauthenticatedUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16),
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? DarkModeColors.button
                  : LightModeColors.button,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Text(
              'Login',
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? DarkModeColors.text2
                    : LightModeColors.text2,
              ),
            )),
        const SizedBox(
          width: 10,
        ),
        TextButton(
            style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.all(16)),
                foregroundColor:
                    WidgetStateProperty.resolveWith<Color>((Set states) {
                  if (states.contains(WidgetState.hovered) ||
                      states.contains(WidgetState.pressed)) {
                    return Theme.of(context).brightness == Brightness.dark
                        ? DarkModeColors.text2
                        : LightModeColors.text2;
                  }
                  return Theme.of(context).brightness == Brightness.dark
                      ? DarkModeColors.text
                      : LightModeColors.text;
                }),
                backgroundColor:
                    WidgetStateProperty.resolveWith<Color>((Set states) {
                  if (states.contains(WidgetState.hovered) ||
                      states.contains(WidgetState.pressed)) {
                    return Theme.of(context).brightness == Brightness.dark
                        ? DarkModeColors.button
                        : LightModeColors.button;
                  }
                  return Colors.transparent;
                })),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignupPage()));
            },
            child: const Text(
              'Signup',
            )),
      ],
    ));
  }
}
