import 'package:cybersage/Components/Profile/authenticated_user.dart';
import 'package:cybersage/Components/Profile/unauthenticateduser.dart';
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
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthAuthenticated) {
          return const AuthenticatedUser();
        } else if (state is AuthUnauthenticated) {
          return const UnauthenticatedUser();
        } else if (state is AuthFailed) {
          return const Center(child: Text('Auth failed'));
        } else {
          return (const Center(child: Text('Something went wrong')));
        }
      },
    );
  }
}
