part of 'userchats_bloc.dart';

@immutable
sealed class UserchatsEvent {}

class FetchUserchats extends UserchatsEvent {
  final int userId;
  final String token;
  final String chatType;

  FetchUserchats(this.userId, this.token, this.chatType);
}

class CreateUserchats extends UserchatsEvent {
  final int userId;
  final String chatName;
  final String token;
  final String chatType;

  CreateUserchats(this.chatName, this.userId, this.token, this.chatType);
}

class UpdateUserchats extends UserchatsEvent {
  final int chatId;
  final int userId;
  final String token;
  final UpdateChatsActions updateAction;
  UpdateUserchats(this.chatId, this.userId, this.token, this.updateAction);
}
