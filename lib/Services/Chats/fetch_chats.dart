import 'dart:convert';

import 'package:cybersage/data/Models/chat_model.dart';
import 'package:cybersage/Services/get_device_info.dart';

import 'package:http/http.dart' as http;

Future<List<ChatModel>> fetchAllChats({
  required int userId,
  required String token,
}) async {
  final response = await http.get(
    Uri.parse('${getDeviceInfo()['url']}/api/chats/$userId'),
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
  }
  return [];
}

Future<List<ChatModel>> fetchPrivateChats({
  required int userId,
  required String token,
}) async {
  final response = await http.get(
    Uri.parse('${getDeviceInfo()['url']}/api/chats/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    List<ChatModel> chats =
        jsonList.map((json) => ChatModel.fromJson(json)).toList();

    chats.removeWhere((chat) => chat.chatType != 'private');
    return chats;
  }
  return [];
}

Future<List<ChatModel>> fetchPublicChats(
    {required int userId, required String token}) async {
  final response = await http.get(
    Uri.parse('${getDeviceInfo()['url']}/api/chats/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    List<dynamic> jsonList = json.decode(response.body);
    List<ChatModel> chats =
        jsonList.map((json) => ChatModel.fromJson(json)).toList();

    chats.removeWhere((chat) => chat.chatType != 'room');
    return chats;
  }
  return [];
}
