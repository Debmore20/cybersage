import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget buildQuickAccessTools(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Quick Access',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? DarkModeColors.text : LightModeColors.text),
        ).animate().fadeIn(delay: 300.ms),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildToolIcon(Icons.note, 'Notes', context),
          buildToolIcon(Icons.checklist, 'Tasks', context),
          buildToolIcon(Icons.calendar_today, 'Schedule', context),
        ],
      ).animate().fadeIn(),
    ],
  );
}

Widget buildToolIcon(IconData icon, String label, BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Column(
    children: [
      CircleAvatar(
        backgroundColor:
            isDarkMode ? DarkModeColors.button : LightModeColors.button,
        radius: 25,
        child: Icon(icon,
            color: isDarkMode ? DarkModeColors.accent : LightModeColors.accent),
      ),
      const SizedBox(height: 5),
      Text(label),
    ],
  ).animate().fadeIn(delay: 700.ms).moveY(begin: 20);
}
