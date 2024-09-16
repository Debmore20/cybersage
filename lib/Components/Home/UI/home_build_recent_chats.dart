import 'package:cybersage/Components/components_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget buildRecentChats(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

  return Flexible(
    flex: 5,
    child: ChatsListContainer(
            isDarkMode: isDarkMode, verticalScrollDirection: 'vertical')
        .animate()
        .fadeIn(delay: 400.ms),
  );
}
