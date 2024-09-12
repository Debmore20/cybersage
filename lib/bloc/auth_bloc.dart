import 'dart:convert';

import 'dart:io' show Platform; // Import Platform class from dart:io
import 'package:flutter/foundation.dart' show kIsWeb; // Import kIsWeb

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
    final String baseUrl;
    if (kIsWeb) {
      baseUrl = 'http://localhost:5000/';
    } else if (Platform.isAndroid) {
      baseUrl = 'http://10.0.2.2:5000/';
    } else if (Platform.isIOS) {
      baseUrl = 'http://localhost:5000/';
    } else {
      baseUrl = 'http://localhost:5000/';
    }

    try {
      final response = await http.post(
        Uri.parse('${baseUrl}api/users/login'),
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

        final int id = data['id'];
        final String email = data['email'];

        final User user = User(id: id, email: email);

        // await _secureStorage.write(key: 'token', value: token);
        // sleep(const Duration(milliseconds: 150));
        emit(AuthAuthenticated(user: user, token: token));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      print(e);
      emit(AuthFailed());
    }
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
