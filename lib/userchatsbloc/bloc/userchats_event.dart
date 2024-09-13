part of 'userchats_bloc.dart';

@immutable
sealed class UserchatsEvent {}

class FetchUserchats extends UserchatsEvent {
  final int userId;
  final String token;

  FetchUserchats(this.userId, this.token);
}

class UpdateUserchats extends UserchatsEvent {
  final String roomName;
  final int userId;
  final String token;

  UpdateUserchats(this.roomName, this.userId, this.token);
}
