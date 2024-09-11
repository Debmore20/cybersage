import 'package:cybersage/Components/Profile/authenticated_user.dart';
import 'package:cybersage/Components/Profile/unauthenticateduser.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UnauthenticatedUser();
    // return const Padding(
    //     padding: EdgeInsets.all(16.0), child: AuthenticatedUser());
  }
}
