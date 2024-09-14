import '../Components/Home/home_components_exports.dart';
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
}
