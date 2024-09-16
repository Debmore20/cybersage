import 'package:cybersage/Components/Rooms/UI/chat_card.dart';
import 'package:cybersage/Models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatefulWidget {
  final List<ChatModel> chats;
  final String scrollDirection;
  const ChatsList(
      {super.key, required this.chats, required this.scrollDirection});

  @override
  State<ChatsList> createState() => _ChatsListState();
}

class _ChatsListState extends State<ChatsList> {
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
    return ListView.builder(
      shrinkWrap: true,
      controller: _scrollController,
      scrollDirection: widget.scrollDirection == 'vertical'
          ? Axis.vertical
          : Axis.horizontal,
      reverse: true,
      itemCount: widget.chats.length, // Placeholder count for popular rooms
      itemBuilder: (context, index) {
        return ChatsCard(
            index: index,
            id: widget.chats[index].id,
            chatName: widget.chats[index].chatName);
      },
    );
  }
}
