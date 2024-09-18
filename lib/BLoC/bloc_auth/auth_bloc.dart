import 'dart:convert';

import 'package:cybersage/Services/services_exports.dart';
import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:cybersage/Models/models_exports.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  final deviceInfo = getDeviceInfo();

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
    on<AuthRegisterEvent>(_onRegister);
    on<CheckStatusEvent>(_onCheckStatus);
  }

  Future<void> _onRegister(
      AuthRegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await http.post(
        Uri.parse('${getDeviceInfo()['url']}/api/users/register'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'firstName': event.firstName,
          'lastName': event.lastName,
          'userName': event.userName,
          'phone': event.phone,
          'email': event.email,
          'password': event.password,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(AuthSignUp(message: 'Success', error: false));
      } else {
        emit(AuthSignUp(message: ' Failed to Register'));
      }
    } catch (e) {
      emit(AuthSignUp(message: 'Failed to Register'));
    }
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await http.post(
        Uri.parse('${getDeviceInfo()['url']}/api/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': event.email,
          'password': event.password,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response.body);
        final token = body['token'];
        final data = body['user'];

        final User user = User(
          id: data['id'],
          firstName: data['firstName'],
          lastName: data['lastName'],
          userName: data['userName'],
          phone: data['phone'],
          email: data['email'],
          createdAt: DateTime.parse(data['createdAt']),
        );

        emit(AuthLogin(message: 'Success', error: false));
        emit(AuthAuthenticated(user: user, token: token));
      } else {
        emit(AuthLogin(message: 'Failed to Login'));
      }
    } catch (e) {
      emit(AuthLogin());
    }
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    await _secureStorage.delete(key: 'token');
    emit(AuthInitial());
  }

  Future<void> _onCheckStatus(
      CheckStatusEvent event, Emitter<AuthState> emit) async {
    final token = await _secureStorage.read(key: 'token');
    final user = await _secureStorage.read(key: 'user');
    if (token != null) {
      emit(AuthAuthenticated(
          token: token, user: User.fromJson(jsonDecode(user!))));
    } else {
      emit(AuthUnauthenticated());
    }
  }
}
