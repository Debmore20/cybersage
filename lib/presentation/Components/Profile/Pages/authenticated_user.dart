import 'package:cybersage/data/Models/user_model.dart';
import 'package:cybersage/data/BLoC/bloc_auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticatedUser extends StatefulWidget {
  const AuthenticatedUser({super.key, required this.user, required this.token});
  final User user;
  final String token;

  @override
  State<AuthenticatedUser> createState() => _AuthenticatedUserState();
}

class _AuthenticatedUserState extends State<AuthenticatedUser> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User Information
        Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24.0,
              bottom: 0.0,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  backgroundImage: const AssetImage(
                      'assets/images/profile_picture.png'), // Placeholder image
                ),
                const SizedBox(height: 10),
                Text(
                  ('${widget.user.firstName} ${widget.user.lastName}')
                      .toString(),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.user.userName,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Profile Options
        Expanded(
          child: ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Edit Profile'),
                onTap: () {
                  // Navigate to edit profile page
                },
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Change Email'),
                onTap: () {
                  // Navigate to change email page
                },
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Change Password'),
                onTap: () {
                  // Navigate to change password page
                },
              ),
              ListTile(
                leading: const Icon(Icons.security),
                title: const Text('Privacy Settings'),
                onTap: () {
                  // Navigate to privacy settings page
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () {
                  // Handle logout
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure you want to log out?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthLogoutEvent());
                            Navigator.of(context).pop(); // Close the dialog
                            // Add logout logic here
                          },
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
