import 'dart:convert';

import 'package:cybersage/Services/get_device_info.dart';

import 'package:http/http.dart' as http;

Future<dynamic> createNewPrivateChat(
    String chatName, int userId, String token) async {
  final response = await http.post(
    Uri.parse('${getDeviceInfo()['url']}/api/chats/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
      'chatName': chatName,
      'chatType': 'private',
    }),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    return 'Failed to create chat';
  }
}

Future<dynamic> createNewPublicChat(
    String chatName, int userId, String token) async {
  final response = await http.post(
    Uri.parse('${getDeviceInfo()['url']}/api/chats/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'userId': userId,
      'chatName': chatName,
      'chatType': 'public',
    }),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body);
  } else {
    return 'Failed to create chat';
  }
}
