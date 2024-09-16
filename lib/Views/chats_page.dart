import 'package:cybersage/Components/components_exports.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';

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
        body: const Column(
          children: [
            // Search Bar
            ChatsSearchBar(),
            // Chat List
            ChatList()
          ],
        ),
        floatingActionButton: const ChatsActionBtns());
  }
}
