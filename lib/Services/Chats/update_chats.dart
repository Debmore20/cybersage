// ignore_for_file: overridden_fields

import 'package:cybersage/data/BLoC/bloc_exports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
