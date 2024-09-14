import 'package:cybersage/Components/Rooms/UI/room_card.dart';
import 'package:cybersage/Models/chat_model.dart';
import 'package:flutter/material.dart';

class RoomsList extends StatefulWidget {
  final List<ChatModel> chats;
  const RoomsList({super.key, required this.chats});

  @override
  State<RoomsList> createState() => _RoomsListState();
}

class _RoomsListState extends State<RoomsList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return (ListView.builder(
      controller: _scrollController,
      reverse: true,
      itemCount: widget.chats.length, // Placeholder count for popular rooms
      itemBuilder: (context, index) {
        return RoomCard(
            index: index,
            id: widget.chats[index].id,
            chatName: widget.chats[index].chatName);
      },
    ));
  }
}
