import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget joinChatBar(BuildContext context) {
  return TextField(
    decoration: InputDecoration(
      hintText: 'Enter Room ID to Join',
      prefixIcon: const Icon(Icons.meeting_room),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    onSubmitted: (value) {
      // Handle join room by ID action
    },
  ).animate().fadeIn().moveX(begin: -20, curve: Curves.easeOut);
}
