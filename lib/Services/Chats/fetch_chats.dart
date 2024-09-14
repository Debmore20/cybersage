import 'dart:convert';
import 'dart:io';

import 'package:cybersage/Models/chat_model.dart';
import 'package:cybersage/Models/user_model.dart';
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

Future<List<ChatModel>> fetchChats(
    {required int userId, required String token}) async {
  final response = await http.get(
    Uri.parse('${_getPlatform()}api/chats/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    List<ChatModel> chats =
        jsonList.map((json) => ChatModel.fromJson(json)).toList();
    return chats;
  } else {
    throw Exception('Failed to load users');
  }
}
