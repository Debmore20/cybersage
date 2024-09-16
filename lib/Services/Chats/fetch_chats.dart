import 'dart:convert';

import 'package:cybersage/Models/chat_model.dart';
import 'package:cybersage/Services/get_device_info.dart';

import 'package:http/http.dart' as http;

Future<List<ChatModel>> fetchChats(
    {required int userId,
    required String token,
    required String chatType}) async {
  final response = await http.get(
    Uri.parse('${getDeviceInfo()['url']}/api/chats/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    },
  );
  if (response.statusCode == 200) {
    if (chatType == 'all') {
      List<dynamic> jsonList = json.decode(response.body);
      List<ChatModel> chats =
          jsonList.map((json) => ChatModel.fromJson(json)).toList();

      chats.removeWhere((chat) => chat.chatType != 'room');
      return chats;
    } else if (chatType == 'room') {
      List<dynamic> jsonList = json.decode(response.body);
      List<ChatModel> chats =
          jsonList.map((json) => ChatModel.fromJson(json)).toList();

      chats.removeWhere((chat) => chat.chatType != 'room');
      return chats;
    }
  } else if (chatType == 'private') {
    List<dynamic> jsonList = json.decode(response.body);
    List<ChatModel> chats =
        jsonList.map((json) => ChatModel.fromJson(json)).toList();

    chats.removeWhere((chat) => chat.chatType != 'private');
    return chats;
  }
  return [];
}
