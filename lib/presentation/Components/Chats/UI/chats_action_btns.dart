import 'package:cybersage/presentation/Components/components_exports.dart';
import 'package:cybersage/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatsActionBtns extends StatelessWidget {
  const ChatsActionBtns({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // New Chat Button
        Padding(
          padding: const EdgeInsets.only(right: 48),
          child: FloatingActionButton.extended(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const CreateRoomDialog());
            },

            label: Text(
              'New Chat',
              style: TextStyle(
                  color:
                      isDarkMode ? DarkModeColors.text : LightModeColors.text),
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
    );
  }
}
