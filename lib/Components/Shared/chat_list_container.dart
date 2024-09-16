import 'package:cybersage/BLoC/bloc_exports.dart';
import 'package:cybersage/Components/components_exports.dart';
import 'package:cybersage/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsListContainer extends StatefulWidget {
  const ChatsListContainer({
    super.key,
    required this.isDarkMode,
    required this.verticalScrollDirection,
  });

  final String verticalScrollDirection;

  final bool isDarkMode;

  @override
  State<ChatsListContainer> createState() => _ChatsListContainerState();
}

class _ChatsListContainerState extends State<ChatsListContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserchatsBloc, UserchatsState>(
      listener: (context, state) {
        if (state is UserchatsCreated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: widget.isDarkMode
                  ? DarkModeColors.button
                  : LightModeColors.button,
              content: Text(state.message),
            ),
          );
        }
      },
      child:
          BlocBuilder<UserchatsBloc, UserchatsState>(builder: (context, state) {
        if (state is UserchatsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserchatsLoaded) {
          return ChatsList(
              chats: state.userchats,
              scrollDirection: widget.verticalScrollDirection);
        } else if (state is UserchatsCreated) {
          return ChatsList(
              chats: state.userchats,
              scrollDirection: widget.verticalScrollDirection);
        }
        return Container();
      }),
    );
  }
}
