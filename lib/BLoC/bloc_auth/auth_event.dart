part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  final Map<String, dynamic> deviceInfo;
  AuthLoginEvent(
      {required this.deviceInfo, required this.email, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String userName;
  final String phone;
  final String email;
  final String password;
  final Map<String, dynamic> deviceInfo;
  AuthRegisterEvent(
      {required this.deviceInfo,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phone,
      required this.email,
      required this.password});
}

class AuthLogoutEvent extends AuthEvent {}

class CheckStatusEvent extends AuthEvent {}
