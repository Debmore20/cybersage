import 'package:cybersage/Components/Home/UI/home_recent_chats_box.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget buildRecentChats(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Recent Chats',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? DarkModeColors.text : LightModeColors.text),
        ).animate().fadeIn(delay: 300.ms),
      ),
      const SizedBox(height: 12),
      SizedBox(
        height: 120,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(4, (index) {
            return RecentChatsBox(index: index);
          }),
        ),
      ),
    ],
  );
}
