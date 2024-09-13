import 'dart:io';

import 'package:cybersage/Utils/colors.dart';
import 'package:cybersage/authbloc/auth_bloc.dart';
import 'package:cybersage/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Pages/profile_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLogin) {
            if (state.error) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white),
                  ), // Show the error message from state
                  backgroundColor: Colors.red));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    state.message,
                    style: const TextStyle(color: Colors.white),
                  ), // Show the error message from state
                  backgroundColor: Colors.green));
              Navigator.pop(context);
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
              right: 24.0, left: 24.0, top: 64, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding:
                        EdgeInsets.only(top: 8.0, bottom: 8.0, right: 24.0),
                    child: Icon(Icons.arrow_back_ios),
                  )),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: isDarkMode
                                ? DarkModeColors.text
                                : LightModeColors.text,
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
                            color: isDarkMode
                                ? DarkModeColors.text
                                : LightModeColors.text,
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
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
