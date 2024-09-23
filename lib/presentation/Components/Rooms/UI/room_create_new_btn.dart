import 'package:cybersage/presentation/Components/Rooms/UI/create_room_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

Widget roomCreateNewBtn(BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      showDialog(
          context: context, builder: (context) => const CreateRoomDialog());
    },
    icon: const Icon(Icons.add),
    label: const Text('Create New Chat'),
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFBDB76B), // Beige color
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  ).animate().fadeIn().moveX(begin: -20, curve: Curves.easeOut);
}
