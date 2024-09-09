import 'package:cybersage/Components/Rooms/room_chatbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoomChatbox(
                      name: 'Room ${index + 1}', lastSeen: DateTime.now()))),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoomChatbox(
                    name: 'Room ${index + 1}', lastSeen: DateTime.now()))),
      ),
    ).animate().fadeIn(delay: (index * 100).ms).moveY(begin: 20);
  }
}
