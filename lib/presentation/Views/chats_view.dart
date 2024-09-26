import 'package:cybersage/data/BLoC/bloc_exports.dart';
import 'package:cybersage/presentation/Components/components_exports.dart';
import 'package:cybersage/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
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
      context.read<UserchatsBloc>().add(FetchPublicUserChats(
            state.user.id,
            state.token,
          ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chats',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: isDarkMode
              ? DarkModeColors.button
              : LightModeColors.button, // Beige color
          elevation: 0,
        ),
        body: const Column(
          children: [
            // Search Bar
            ChatsSearchBar(),
            // Chat List
            Flexible(
              flex: 5,
              child: ChatsListContainer(
                isPrivateChat: true,
              ),
            ),

            SizedBox(height: 24),
          ],
        ),
        floatingActionButton: const ChatsActionBtns());
  }
}
