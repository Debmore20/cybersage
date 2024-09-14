import 'dart:io';

import 'package:cybersage/Utils/colors.dart';
import 'package:cybersage/BLoC/bloc_auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignUp) {
            if (state.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    content: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white),
                    ), // Show the error message from state
                    backgroundColor: state.error ? Colors.red : Colors.green),
              );
            } else {
              sleep(const Duration(seconds: 2));
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
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: isDarkMode
                                ? DarkModeColors.text
                                : LightModeColors.text,
                          ),
                          labelText: 'First Name',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isDarkMode
                                      ? DarkModeColors.button
                                      : LightModeColors.button))),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter First Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: isDarkMode
                                ? DarkModeColors.text
                                : LightModeColors.text,
                          ),
                          labelText: 'Last Name',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isDarkMode
                                      ? DarkModeColors.button
                                      : LightModeColors.button))),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Last Name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: isDarkMode
                                ? DarkModeColors.text
                                : LightModeColors.text,
                          ),
                          labelText: 'Username',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isDarkMode
                                      ? DarkModeColors.button
                                      : LightModeColors.button))),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter desired Username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: isDarkMode
                                ? DarkModeColors.text
                                : LightModeColors.text,
                          ),
                          labelText: 'Phone No.',
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isDarkMode
                                      ? DarkModeColors.button
                                      : LightModeColors.button))),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Phone Number';
                        }
                        return null;
                      },
                    ),
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
                          return 'Please enter Email';
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
                          return 'Please enter desired Password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
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
