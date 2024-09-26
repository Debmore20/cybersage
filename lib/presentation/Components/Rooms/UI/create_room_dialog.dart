import 'package:cybersage/data/BLoC/bloc_auth/auth_bloc.dart';
import 'package:cybersage/data/BLoC/bloc_user_chats/userchats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateRoomDialog extends StatefulWidget {
  const CreateRoomDialog({super.key});

  @override
  State<CreateRoomDialog> createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends State<CreateRoomDialog> {
  final TextEditingController roomNameController = TextEditingController();

  bool isPrivate = false;
  String chatType = 'Private';

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
      title: Text('Create ${isPrivate ? 'Room' : 'Private'} Chat'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
              value: isPrivate,
              onChanged: (value) {
                setState(() {
                  isPrivate = value;

                  chatType = isPrivate ? 'Room' : 'Private';
                });
              },
              title: Text('$chatType Chat')),
          TextField(
            controller: roomNameController,
            decoration: const InputDecoration(labelText: 'Chat Name'),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(height: 16.0),
          isPrivate
              ? IconButton.outlined(
                  onPressed: () {}, icon: const Icon(Icons.add))
              : Container(
                  color: Colors.white24,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 48,
                ),
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
            isPrivate
                ? {
                    if (state is AuthAuthenticated)
                      {
                        context.read<UserchatsBloc>().add(CreatePrivateUserChat(
                              roomNameController.text,
                              state.user.id,
                              state.token,
                            ))
                      }
                  }
                : {
                    if (state is AuthAuthenticated)
                      {
                        context.read<UserchatsBloc>().add(CreatePublicUserChat(
                              roomNameController.text,
                              state.user.id,
                              state.token,
                            ))
                      }
                  };

            Navigator.of(context).pop();
          },
          child: const Text('Create'),
        ),
      ],
    );
  }
}
