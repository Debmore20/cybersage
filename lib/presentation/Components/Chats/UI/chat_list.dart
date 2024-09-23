import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Pages/chatbox.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10, // Placeholder count for existing chats
        itemBuilder: (context, index) {
          String username = 'User ${index + 1}';
          return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, color: Colors.white),
              ),
              title: Text(username),
              subtitle: const Text('Last message...'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChatBox(
                              name: username,
                              lastSeen: DateTime.now(),
                            )));
              }).animate().fadeIn(delay: (index * 100).ms).moveX(begin: -20);
        },
      ),
    );
  }
}
