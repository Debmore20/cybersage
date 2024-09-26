import 'package:cybersage/presentation/Components/components_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget buildRecentChats(BuildContext context) {
  return Flexible(
    flex: 5,
    child: const ChatsListContainer(verticalScrollDirection: 'vertical')
        .animate()
        .fadeIn(delay: 400.ms),
  );
}
