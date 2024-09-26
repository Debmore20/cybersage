import 'package:cybersage/data/BLoC/bloc_exports.dart';
import 'package:cybersage/presentation/Components/components_exports.dart';
import 'package:cybersage/data/Models/models_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsView extends StatefulWidget {
  const RoomsView({super.key});

  @override
  State<RoomsView> createState() => _RoomsViewState();
}

class _RoomsViewState extends State<RoomsView> {
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
          .add(FetchPublicUserChats(state.user.id, state.token));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          // Create New Room Button
          roomCreateNewBtn(context).animate().fadeIn(delay: 100.ms),
          const SizedBox(height: 20),
          // Join Room by ID
          roomJoinBar(context).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 20),
          // Explore Popular Rooms
          const Text(
            'Your Rooms',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(
            height: 12,
          ),
          const Flexible(
            flex: 5,
            child: ChatsListContainer(
              verticalScrollDirection: 'vertical',
            ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }
}
