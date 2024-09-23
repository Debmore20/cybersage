part of 'userchats_bloc.dart';

@immutable
sealed class UserChatsState {}

final class UserChatsInitial extends UserChatsState {}

final class UserChatsLoading extends UserChatsState {}

final class AllUserChatsLoaded extends UserChatsState {
  final List<ChatModel> userChats;
  AllUserChatsLoaded({required this.userChats});
}

final class PrivateUserChatsLoaded extends UserChatsState {
  final List<ChatModel> userChats;
  PrivateUserChatsLoaded({required this.userChats});
}

final class PublicUserChatsLoaded extends UserChatsState {
  final List<ChatModel> userChats;
  PublicUserChatsLoaded({required this.userChats});
}

final class PrivateUserChatCreated extends UserChatsState {
  final String message;
  final List<ChatModel> userChats;
  PrivateUserChatCreated({required this.userChats, required this.message});
}

final class PublicUserChatCreated extends UserChatsState {
  final String message;
  final List<ChatModel> userChats;
  PublicUserChatCreated({required this.userChats, required this.message});
}

final class UserChatUpdated extends UserChatsState {
  final String message;
  final List<ChatModel> userChats;
  UserChatUpdated({required this.userChats, required this.message});
}

final class UserChatDeleted extends UserChatsState {
  final String message;
  UserChatDeleted({required this.message});
}

final class UserChatsError extends UserChatsState {
  final String message;
  UserChatsError({required this.message});
}
