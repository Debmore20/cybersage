import 'package:cybersage/BLoC/bloc_auth/auth_bloc.dart';
import 'package:cybersage/BLoC/cubit_device_info/device_info_cubit.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBtn extends StatelessWidget {
  const SignupBtn(
      {super.key,
      required this.formKey,
      required this.firstNameController,
      required this.lastNameController,
      required this.usernameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController});

  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController usernameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<DeviceInfoCubit, DeviceInfoState>(
        builder: (context, state) {
      final Map<String, dynamic> platform;
      if (state is DeviceInfoInitial) {
        platform = state.deviceInfo;
      } else if (state is DeviceInfoInitial) {
        platform = state.deviceInfo;
      } else {
        platform = {
          'platform': 'Unknown',
          'url': 'https://localhost:5000/',
        };
      }

      return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
          isDarkMode ? DarkModeColors.button : LightModeColors.button,
        )),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            context.read<AuthBloc>().add(
                  AuthRegisterEvent(
                      deviceInfo: platform,
                      firstName: firstNameController.text,
                      lastName: lastNameController.text,
                      userName: usernameController.text,
                      phone: phoneController.text,
                      email: emailController.text,
                      password: passwordController.text),
                );
          }
        },
        child: Text(
          'Sign Up',
          style: TextStyle(
              color: isDarkMode ? LightModeColors.text2 : DarkModeColors.text2),
        ),
      );
    });
  }
}
