import 'dart:convert';

import 'package:cybersage/Pages/profile_page.dart';
import 'package:cybersage/Services/Chats/create_room.dart';
import 'package:cybersage/authbloc/auth_bloc.dart';
import 'package:cybersage/userchatsbloc/bloc/userchats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CreateRoomDialog extends StatefulWidget {
  const CreateRoomDialog({super.key});

  @override
  State<CreateRoomDialog> createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends State<CreateRoomDialog> {
  final TextEditingController roomNameController = TextEditingController();

  String _text = '';

  @override
  void initState() {
    super.initState();
    // Add a listener to the controller
    roomNameController.addListener(() {
      // Update the state when the text changes
      setState(() {
        _text = roomNameController.text;
      });
    });
  }

  @override
  void dispose() {
    roomNameController
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.read<AuthBloc>().state;

    return AlertDialog(
      title: const Text('Create Room'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: roomNameController,
            decoration: const InputDecoration(labelText: 'Room Name'),
          ),
          const SizedBox(height: 16.0),
          Text('Room Name: $_text'),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              // Perform the room creation logic here
              print('Creating room: ${roomNameController.text}');
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (state is AuthAuthenticated) {
              print('Creating room');
              context
                  .read<UserchatsBloc>()
                  .add(UpdateUserchats(_text, state.user.id, state.token));
            }

            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
