import 'package:cybersage/data/BLoC/bloc_exports.dart';
import 'package:cybersage/presentation/Components/components_exports.dart';
import 'package:cybersage/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsListContainer extends StatefulWidget {
  const ChatsListContainer({
    super.key,
    this.verticalScrollDirection = 'vertical',
    this.isPrivateChat = false,
  });

  final String verticalScrollDirection;
  final bool isPrivateChat;

  @override
  State<ChatsListContainer> createState() => _ChatsListContainerState();
}

class _ChatsListContainerState extends State<ChatsListContainer> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return BlocListener<UserchatsBloc, UserChatsState>(
      listener: (context, state) {
        if (state is PrivateUserChatCreated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor:
                  isDarkMode ? DarkModeColors.button : LightModeColors.button,
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticated) {
            return BlocBuilder<UserchatsBloc, UserChatsState>(
                builder: (context, state) {
              if (state is UserChatsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AllUserChatsLoaded) {
                return ChatsList(
                    chats: state.userChats,
                    scrollDirection: widget.verticalScrollDirection);
              } else if (state is PrivateUserChatsLoaded) {
                return ChatsList(
                    chats: state.userChats,
                    scrollDirection: widget.verticalScrollDirection);
              } else if (state is PrivateUserChatCreated) {
                return ChatsList(
                    chats: state.userChats,
                    scrollDirection: widget.verticalScrollDirection);
              } else if (state is PublicUserChatsLoaded) {
                return ChatsList(
                    chats: state.userChats,
                    scrollDirection: widget.verticalScrollDirection);
              } else if (state is PublicUserChatCreated) {
                return ChatsList(
                    chats: state.userChats,
                    scrollDirection: widget.verticalScrollDirection);
              }
              return Container();
            });
          }
          return Container();
        },
      ),
    );
  }
}
