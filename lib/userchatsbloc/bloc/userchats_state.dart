part of 'userchats_bloc.dart';

@immutable
sealed class UserchatsState {}

final class UserchatsInitial extends UserchatsState {}

final class UserchatsLoading extends UserchatsState {}

final class UserchatsLoaded extends UserchatsState {
  final List<ChatModel> userchats;
  UserchatsLoaded({required this.userchats});
}

final class UserchatsError extends UserchatsState {
  final String message;
  UserchatsError({required this.message});
}
