import 'package:cybersage/BLoC/bloc_exports.dart';
import 'package:cybersage/Components/Rooms/rooms_components_exports.dart';
import 'package:cybersage/Models/chat_model.dart';
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
          const RoomCreateNewBtn(),
          const SizedBox(height: 20),
          // Join Room by ID
          const RoomJoinBar(),
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
                return const CircularProgressIndicator();
              } else if (state is UserchatsLoaded) {
                return RoomsList(chats: state.userchats);
              }
              return Container();
            }),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
