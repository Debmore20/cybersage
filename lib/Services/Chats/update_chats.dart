// ignore_for_file: overridden_fields

import 'dart:convert';

import 'package:cybersage/BLoC/bloc_exports.dart';
import 'package:cybersage/Services/services_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

Future<void> onUpdateChats(
    UpdateUserchats event, Emitter<UserchatsState> emit) async {
  switch (event.updateAction.actionName) {
    case 'updateChatName':
      await event.updateAction.updateChatName(
          userId: event.userId,
          chatId: event.chatId,
          token: event.token,
          updatedChatName: event.updateAction.updatedChatName);
      break;
    case 'updateChatMembers':
      await event.updateAction.updateChatMembers(
          userId: event.userId,
          chatId: event.chatId,
          token: event.token,
          newChatMembers: event.updateAction.newChatMembers);
      break;
    default:
      break;
  }
}

class UpdateChatsActions {
  String actionName = '';
  String updatedChatName = '';
  List<int> newChatMembers = [];

  Future<dynamic> updateChatName(
      {required int userId,
      required int chatId,
      required String token,
      required String updatedChatName}) async {}

  Future<dynamic> updateChatMembers(
      {required int userId,
      required int chatId,
      required String token,
      required List<int> newChatMembers}) async {}
}

class UpdateChatName extends UpdateChatsActions {
  @override
  String actionName = 'updateChatName';

  @override
  Future<dynamic> updateChatName(
      {required int userId,
      required int chatId,
      required String token,
      required String updatedChatName}) async {
    final response = await http.post(
      Uri.parse('${getDeviceInfo()}/api/chats/$chatId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userId': userId,
        'chatId': chatId,
        'action': actionName,
        'token': token,
        'updatedChatName': updatedChatName,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}

class UpdateChatMembers extends UpdateChatsActions {
  @override
  String actionName = 'updateChatMembers';
  @override
  Future<dynamic> updateChatMembers(
      {required int userId,
      required int chatId,
      required String token,
      required List<int> newChatMembers}) async {
    final response = await http.post(
      Uri.parse('${getDeviceInfo()}/api/chats/$chatId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userId': userId,
        'chatId': chatId,
        'action': 'updateChatName',
        'token': token,
        'newChatMembers': newChatMembers,
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
