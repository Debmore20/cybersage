import 'package:cybersage/Components/Rooms/create_room_dialog.dart';
import 'package:cybersage/Components/Rooms/room_card.dart';
import 'package:cybersage/Components/Rooms/rooms_list.dart';
import 'package:cybersage/Models/chat_model.dart';
import 'package:cybersage/Models/user_model.dart';
import 'package:cybersage/Services/Chats/fetch_chats.dart';
import 'package:cybersage/authbloc/auth_bloc.dart';
import 'package:cybersage/userchatsbloc/bloc/userchats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({super.key});

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  List<ChatModel> chats = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _afterBuild();
    });
  }

  void _afterBuild() {
    final state = context.read<AuthBloc>().state;
    if (state is AuthAuthenticated) {
      context
          .read<UserchatsBloc>()
          .add(FetchUserchats(state.user.id, state.token));
    }
    setState(() {});
  }

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
              showDialog(
                  context: context, builder: (context) => CreateRoomDialog());
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
          const SizedBox(
            height: 12,
          ),
          Flexible(
            flex: 5,
            child: BlocBuilder<UserchatsBloc, UserchatsState>(
                builder: (context, state) {
              if (state is UserchatsLoading) {
                return CircularProgressIndicator();
              } else if (state is UserchatsLoaded) {
                return RoomsList(chats: state.userchats);
              }
              return Container();
            }),
          ),
          const SizedBox(
            height: 12,
          )

          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 3, // Placeholder count for popular rooms
          //     itemBuilder: (context, index) {
          //       return RoomCard(index: index);
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
