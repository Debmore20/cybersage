part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthRegistered extends AuthState {
  final String email;
  final String password;

  final String message;

  AuthRegistered(
      {required this.email,
      required this.password,
      this.message = "Successful Registration"});
}

class AuthAuthenticated extends AuthState {
  final User user;
  final String token;

  final String message;

  AuthAuthenticated(
      {required this.user,
      required this.token,
      this.message = "Authenticated"});
}

class AuthUnauthenticated extends AuthState {
  final String message;

  AuthUnauthenticated({this.message = "Unauthenticated"});
}

class AuthFailed extends AuthState {
  final String message;
  final String error;

  AuthFailed({this.message = "Auth Failed", this.error = ""});
}
