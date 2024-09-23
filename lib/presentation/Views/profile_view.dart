import 'package:cybersage/data/BLoC/bloc_exports.dart';
import 'package:cybersage/presentation/Components/components_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
