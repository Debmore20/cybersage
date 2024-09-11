part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  final String token;

  AuthAuthenticated({required this.user, required this.token});
}

class AuthUnauthenticated extends AuthState {
  final String message;

  AuthUnauthenticated({this.message = "Unauthenticated"});
}
