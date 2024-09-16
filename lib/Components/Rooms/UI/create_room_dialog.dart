import 'package:cybersage/BLoC/bloc_auth/auth_bloc.dart';
import 'package:cybersage/BLoC/bloc_user_chats/userchats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    bool isPrivate = true;
    String chatType = 'Private';

    return AlertDialog(
      title: Text('Create Chat'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
              value: isPrivate,
              onChanged: (value) {
                setState(() {
                  isPrivate = value;
                  print(isPrivate);
                  chatType = isPrivate ? 'Private' : 'Room';
                  print(chatType);
                });
              },
              title: Text('$chatType Chat')),
          TextField(
            controller: roomNameController,
            decoration: const InputDecoration(labelText: 'Chat Name'),
          ),
          const SizedBox(height: 16.0),
          Text('Chat Name: $_text'),
          const SizedBox(height: 16.0),
          InkWell(
            onTap: () {
              // Perform the room creation logic here
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
              context.read<UserchatsBloc>().add(
                  CreateUserchats(_text, state.user.id, state.token, 'room'));
            }

            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
