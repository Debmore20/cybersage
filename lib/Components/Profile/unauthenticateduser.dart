import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  // Future<void> _signUp() async {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     final email = _emailController.text;
  //     final password = _passwordController.text;

  //     final response = await http.post(
  //       Uri.parse('http://localhost:5000/api/users/signup'),
  //       headers: {'Content-Type': 'application/json'},
  //       body: json.encode({'email': email, 'password': password}),
  //     );

  //     if (mounted) {
  //       if (response.statusCode == 201) {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text('Sign-up successful!'),
  //           backgroundColor: Colors.green,
  //         ));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text('Sign-up failed!'),
  //           backgroundColor: Colors.red,
  //         ));
  //       }
  //     }
  //   }
  // }

  // Future<void> _logIn() async {
  //   // if (_formKey.currentState?.validate() ?? false) {
  //   //   final email = _emailController.text;
  //   //   final password = _passwordController.text;

  //   //   final response = await http.post(
  //   //     Uri.parse('http://localhost:5000/api/users/login'),
  //   //     headers: {'Content-Type': 'application/json'},
  //   //     body: json.encode({'email': email, 'password': password}),
  //   //   );

  //   //   try {
  //   //     if (mounted) {
  //   //       if (response.statusCode == 201 || response.statusCode == 200) {
  //   //         print(response.body);
  //   //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //   //           content: Text('Login successful!'),
  //   //           backgroundColor: Colors.green,
  //   //         ));
  //   //       } else {
  //   //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //   //           content: Text('Login failed!'),
  //   //           backgroundColor: Colors.red,
  //   //         ));
  //   //       }
  //   //     }
  //   //   } catch (e) {
  //   //     if (mounted) {
  //   //       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //   //         content: Text('Login successful!'),
  //   //         backgroundColor: Colors.green,
  //   //       ));
  //   //     }
  //   //   }
  //   // }
  // }

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
                    onPressed: () => context.read<AuthBloc>().add(
                          AuthLoginEvent(
                              email: _emailController.text,
                              password: _passwordController.text),
                        ),
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
                    onPressed: () => context.read<AuthBloc>().add(
                          AuthRegisterEvent(
                              email: _emailController.text,
                              password: _passwordController.text),
                        ),
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
