import 'package:cybersage/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChatBox extends StatefulWidget {
  const ChatBox({super.key, required this.name, required this.lastSeen});

  final String name;
  final DateTime lastSeen;

  @override
  // ignore: library_private_types_in_public_api
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final List<Map<String, dynamic>> _messages = []; // List to hold messages

  // Function to pick an image
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _messages.add({
          'type': 'image',
          'content': File(pickedFile.path),
        });
      });
    }
  }

  // Function to send a message
  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'type': 'text',
          'content': _messageController.text,
        });
        _messageController.clear();
      });
    }
  }

  void _navigateChat() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: _navigateChat,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  )),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 24,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(fontSize: 24),
                    )
                  ],
                ),
              )
            ],
          ),
          // Message List
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                if (message['type'] == 'text') {
                  return ListTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color(
                              0xFFF5F5F5), // Light grey for text messages
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          message['content'],
                          style: TextStyle(
                              color: isDarkMode
                                  ? DarkModeColors.messagetext
                                  : LightModeColors.messagetext),
                        ),
                      ),
                    ),
                  );
                } else if (message['type'] == 'image') {
                  return ListTile(
                    title: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Image.file(
                          message['content'],
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          // Input Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo),
                  onPressed: _pickImage,
                ),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                        color: isDarkMode
                            ? DarkModeColors.messagetext
                            : LightModeColors.messagetext),
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
