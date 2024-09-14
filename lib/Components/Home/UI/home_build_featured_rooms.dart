import 'package:cybersage/Components/Home/UI/home_featured_rooms_box.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget buildFeaturedRooms(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Featured Study Rooms',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? DarkModeColors.text : LightModeColors.text),
        ).animate().fadeIn(delay: 300.ms),
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 96,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(5, (index) {
            return FeaturedRoomsBox(index: index);
          }),
        ),
      ),
    ],
  );
}
