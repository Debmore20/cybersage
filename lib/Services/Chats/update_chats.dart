import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

String _getPlatform() {
  String baseUrl;
  if (kIsWeb) {
    baseUrl = 'http://localhost:5000/';
  } else if (Platform.isAndroid) {
    baseUrl = 'http://10.0.2.2:5000/';
  } else if (Platform.isIOS) {
    baseUrl = 'http://localhost:5000/';
  } else {
    baseUrl = 'http://localhost:5000/';
  }
  return baseUrl;
}

Future<void> updateChats(
    {required String roomName,
    required int userId,
    required String token,
    required String chatType}) async {
  final response = await http.post(
    Uri.parse('${_getPlatform()}api/chats'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode(<String, String>{
      'roomName': roomName.toString(),
      'userId': userId.toString(),
      'chatType': chatType.toString(),
    }),
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
  } else {
    throw Exception('Failed to add chat');
  }
}
