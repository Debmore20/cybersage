import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatsSearchBar extends StatelessWidget {
  const ChatsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Chats...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.primary,
        ),
      ).animate().fadeIn().moveY(begin: 20, curve: Curves.easeOut),
    );
  }
}
