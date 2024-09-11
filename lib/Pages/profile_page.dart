import 'package:cybersage/Components/Profile/authenticated_user.dart';
import 'package:cybersage/Components/Profile/unauthenticateduser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthAuthenticated) {
          return const AuthenticatedUser();
        } else if (state is AuthUnauthenticated) {
          return const UnauthenticatedUser();
        } else {
          return const UnauthenticatedUser();
        }
      },
    );
  }
}
