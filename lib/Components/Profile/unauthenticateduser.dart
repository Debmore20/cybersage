import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Utils/colors.dart';
import '../../bloc/auth_bloc.dart';

class UnauthenticatedUser extends StatefulWidget {
  const UnauthenticatedUser({super.key});

  @override
  State<UnauthenticatedUser> createState() => _UnauthenticatedUserState();
}

class _UnauthenticatedUserState extends State<UnauthenticatedUser> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding:
          const EdgeInsets.only(right: 24.0, left: 24.0, top: 48, bottom: 0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color:
                        isDarkMode ? DarkModeColors.text : LightModeColors.text,
                  ),
                  labelText: 'Email',
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isDarkMode
                              ? DarkModeColors.button
                              : LightModeColors.button))),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color:
                        isDarkMode ? DarkModeColors.text : LightModeColors.text,
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: isDarkMode
                              ? DarkModeColors.button
                              : LightModeColors.button))),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                      isDarkMode
                          ? DarkModeColors.button
                          : LightModeColors.button,
                    )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthLoginEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                      }
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          color: isDarkMode
                              ? LightModeColors.text2
                              : DarkModeColors.text2),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                      isDarkMode
                          ? DarkModeColors.button
                          : LightModeColors.button,
                    )),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthRegisterEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text),
                            );
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: isDarkMode
                              ? LightModeColors.text2
                              : DarkModeColors.text2),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
