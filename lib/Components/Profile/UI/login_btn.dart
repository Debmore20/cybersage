import 'package:cybersage/BLoC/bloc_auth/auth_bloc.dart';
import 'package:cybersage/BLoC/cubit_device_info/device_info_cubit.dart';
import 'package:cybersage/Utils/colors.dart';
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
                          deviceInfo: platform,
                          email: emailController.text,
                          password: passwordController.text),
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
        );
      },
    );
  }
}
