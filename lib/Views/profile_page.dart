import 'package:cybersage/BLoC/bloc_exports.dart';
import 'package:cybersage/Components/components_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {},
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
