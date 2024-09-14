import 'package:cybersage/Components/Chats/chat_list.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chats',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: isDarkMode
            ? DarkModeColors.button
            : LightModeColors.button, // Beige color
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Chats...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: AppColors.primary,
              ),
            ).animate().fadeIn().moveY(begin: 20, curve: Curves.easeOut),
          ),
          // Chat List
          const ChatList()
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // New Chat Button
          Padding(
            padding: const EdgeInsets.only(right: 48),
            child: FloatingActionButton.extended(
              onPressed: () {
                // Action for starting a new chat
              },
              label: Text(
                'New Chat',
                style: TextStyle(
                    color: isDarkMode
                        ? DarkModeColors.text
                        : LightModeColors.text),
              ),
              icon: Icon(
                Icons.chat,
                color:
                    isDarkMode ? DarkModeColors.accent : LightModeColors.accent,
              ),
              backgroundColor: isDarkMode
                  ? DarkModeColors.button
                  : LightModeColors.button, // Beige color
              heroTag: 'new-chat',
            ).animate().fadeIn(delay: 400.ms).moveY(begin: 20),
          ),

          const SizedBox(
            height: 48,
          )
        ],
      ),
    );
  }
}
