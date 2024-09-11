import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../Models/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>(_onLogin);
    on<AuthLogoutEvent>(_onLogout);
    on<CheckStatusEvent>(_onCheckStatus);
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/users/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': event.email,
          'password': event.password,
        }),
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final token = body['token'];
        final user = User.fromJson(body['user']);

        await _secureStorage.write(key: 'token', value: token);
        await _secureStorage.write(
            key: 'user', value: jsonEncode(user.toJson()));
        emit(AuthAuthenticated(user: user, token: token));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {}
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    await _secureStorage.delete(key: 'token');
    emit(AuthUnauthenticated());
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
