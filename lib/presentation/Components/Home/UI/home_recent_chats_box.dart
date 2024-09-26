import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../utils/colors.dart';
import '../../Chats/Pages/chatbox.dart';

class RecentChatsBox extends StatelessWidget {
  final int index;

  const RecentChatsBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    String userinitials = 'U ${index + 1}';
    String username = 'User ${index + 1}';
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatBox(
                    name: username,
                    lastSeen: DateTime.now(),
                  ))),
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color:
              isDarkMode ? DarkModeColors.container : LightModeColors.container,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor:
                  isDarkMode ? DarkModeColors.button : LightModeColors.button,
              radius: 32,
              child: Text(
                userinitials,
                style: TextStyle(
                    color: isDarkMode
                        ? DarkModeColors.text2
                        : LightModeColors.text2),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              username,
              style: TextStyle(
                  color:
                      isDarkMode ? DarkModeColors.text : LightModeColors.text),
            )
          ],
        ),
      ).animate().scale(delay: (index * 100).ms),
    );
  }
}
