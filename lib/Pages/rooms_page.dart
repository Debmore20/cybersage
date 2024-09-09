import 'package:cybersage/Components/Rooms/room_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          // Create New Room Button
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to Create Room Page
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
          ).animate().fadeIn().moveX(begin: -20, curve: Curves.easeOut),
          const SizedBox(height: 20),
          // Join Room by ID
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Room ID to Join',
              prefixIcon: const Icon(Icons.meeting_room),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            onSubmitted: (value) {
              // Handle join room by ID action
            },
          ).animate().fadeIn().moveX(begin: -20, curve: Curves.easeOut),
          const SizedBox(height: 20),
          // Explore Popular Rooms
          const Text(
            'Your Rooms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ).animate().fadeIn(delay: 200.ms),
          Expanded(
            child: ListView.builder(
              itemCount: 2, // Placeholder count for popular rooms
              itemBuilder: (context, index) {
                return RoomCard(index: index);
              },
            ),
          ),
          const Text(
            'Popular Rooms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ).animate().fadeIn(delay: 200.ms),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Placeholder count for popular rooms
              itemBuilder: (context, index) {
                return RoomCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
