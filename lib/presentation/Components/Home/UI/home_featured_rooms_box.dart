import 'package:cybersage/presentation/Components/Rooms/Pages/room_chatbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../utils/colors.dart';

class FeaturedRoomsBox extends StatelessWidget {
  final int index;
  const FeaturedRoomsBox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RoomChatbox(
                  name: 'Room ${index + 1}', lastSeen: DateTime.now()))),
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: isDarkMode
                ? DarkModeColors.container
                : LightModeColors.container,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ]),
        child: Center(
          child: Text('Room ${index + 1}'),
        ),
      ).animate().scale(delay: (index * 100).ms),
    );
  }
}
