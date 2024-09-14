import 'package:cybersage/Components/Rooms/UI/create_room_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RoomCreateNewBtn extends StatelessWidget {
  const RoomCreateNewBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        showDialog(
            context: context, builder: (context) => const CreateRoomDialog());
      },
      icon: const Icon(Icons.add),
      label: const Text('Create New Room'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFBDB76B), // Beige color
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ).animate().fadeIn().moveX(begin: -20, curve: Curves.easeOut);
  }
}
