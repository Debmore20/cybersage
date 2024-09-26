part of 'userchats_bloc.dart';

@immutable
sealed class UserChatsEvent {}

class FetchAllUserChats extends UserChatsEvent {
  final int userId;
  final String token;
  FetchAllUserChats(this.userId, this.token);
}

class FetchPrivateUserChats extends UserChatsEvent {
  final int userId;
  final String token;
  FetchPrivateUserChats(this.userId, this.token);
}

class FetchPublicUserChats extends UserChatsEvent {
  final int userId;
  final String token;
  FetchPublicUserChats(this.userId, this.token);
}

class CreatePrivateUserChat extends UserChatsEvent {
  final int userId;
  final String chatName;
  final String token;
  final String chatType = 'private';

  CreatePrivateUserChat(this.chatName, this.userId, this.token);
}

class CreatePublicUserChat extends UserChatsEvent {
  final int userId;
  final String chatName;
  final String token;
  final String chatType = 'public';

  CreatePublicUserChat(this.chatName, this.userId, this.token);
}

class UpdateUserChat extends UserChatsEvent {
  final int chatId;
  final int userId;
  final String token;
  final UpdateChatsActions updateAction;
  UpdateUserChat(this.chatId, this.userId, this.token, this.updateAction);
}

class DeleteUserChat extends UserChatsEvent {
  final int chatId;
  final int userId;
  final String token;
  DeleteUserChat(this.chatId, this.userId, this.token);
}
