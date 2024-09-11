import 'package:cybersage/Components/Home/featured_rooms_box.dart';
import 'package:cybersage/Components/Home/recent_chats_box.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ResponsiveRowColumn(
          // rowColumn: !ResponsiveWrapper.of(context).isSmallerThan(TABLET),
          columnMainAxisAlignment: MainAxisAlignment.start,
          rowPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          columnPadding: const EdgeInsets.symmetric(vertical: 16.0),
          layout: ResponsiveRowColumnType.COLUMN,
          children: [
            // Search Bar
            ResponsiveRowColumnItem(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        height: 120,
                        width: double.infinity,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Study Rooms...',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: isDarkMode
                              ? DarkModeColors.container
                              : LightModeColors.container,
                        ),
                      ),
                    ],
                  )).animate().fadeIn().moveY(begin: 30, curve: Curves.easeOut),
            ),

            const ResponsiveRowColumnItem(
              child: SizedBox(height: 30, width: double.infinity),
            ),

            // Featured Study Rooms
            ResponsiveRowColumnItem(
              child: buildRecentChats(context),
            ),

            const ResponsiveRowColumnItem(
              child: SizedBox(height: 30, width: double.infinity),
            ),

            ResponsiveRowColumnItem(
              child: buildFeaturedRooms(context),
            ),

            const ResponsiveRowColumnItem(
              child: SizedBox(height: 30, width: double.infinity),
            ),

            // Quick Access to Study Tools
            ResponsiveRowColumnItem(
              child: buildQuickAccessTools(context),
            ),
          ],
        ),
      ),
    );
  }

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
              color:
                  isDarkMode ? DarkModeColors.accent : LightModeColors.accent),
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    ).animate().fadeIn(delay: 700.ms).moveY(begin: 20);
  }
}
