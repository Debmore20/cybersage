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
            'Popular Rooms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Placeholder count for popular rooms
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.group, color: Colors.white),
                    ),
                    title: Text('Room ${index + 1}'),
                    subtitle: Text('Description of Room ${index + 1}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        // Navigate to Room details or join the room
                      },
                    ),
                    onTap: () {
                      // Handle tap to explore room
                    },
                  ),
                ).animate().fadeIn(delay: (index * 100).ms).moveY(begin: 20);
              },
            ),
          ),
        ],
      ),
    );
  }
}
