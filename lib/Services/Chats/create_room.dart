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

Future<dynamic> createRoom(String roomName, int userId) async {
  final response = await http.post(
    Uri.parse('${_getPlatform()}api/chats'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userId': userId.toString(),
      'roomName': roomName,
    }),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    return 'Failed to create room';
  }
}
