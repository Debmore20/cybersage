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

class AuthLogin extends AuthState {
  final String message;
  final bool error;

  AuthLogin({this.message = " Login Failed", this.error = true});
}

class AuthSignUp extends AuthState {
  final String message;
  final bool error;

  AuthSignUp({this.message = " Sign UpFailed", this.error = true});
}
