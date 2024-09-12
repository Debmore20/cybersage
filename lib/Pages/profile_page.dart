import 'package:cybersage/Components/Profile/authenticated_user.dart';
import 'package:cybersage/Components/Profile/unauthenticateduser.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLogin) {
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
        }
        if (state is AuthSignUp) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              content: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ), // Show the error message from state
              backgroundColor: DarkModeColors.button,
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthInitial) {
            return const UnauthenticatedUser();
          } else if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthAuthenticated) {
            return AuthenticatedUser(
              user: state.user,
              token: state.token,
            );
          } else if (state is AuthUnauthenticated) {
            return const UnauthenticatedUser();
          }
          return (const UnauthenticatedUser());
        },
      ),
    );
  }
}
