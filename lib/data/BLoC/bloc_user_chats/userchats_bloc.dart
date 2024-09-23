import 'package:bloc/bloc.dart';
import 'package:cybersage/data/BLoC/bloc_user_chats/userChats_bloc.dart';
import 'package:cybersage/data/BLoC/bloc_user_chats/user_actions_model.dart';
import 'package:cybersage/data/Models/chat_model.dart';

import 'package:cybersage/Services/services_exports.dart';
import 'package:meta/meta.dart';

part 'userchats_event.dart';
part 'userchats_state.dart';

class UserchatsBloc extends Bloc<UserChatsEvent, UserChatsState> {
  UserchatsBloc() : super(UserChatsInitial()) {
    Future<void> onFetchAllUserchats(
        FetchAllUserChats event, Emitter<AllUserChatsLoaded> emit) async {
      final chats = await fetchAllChats(
        userId: event.userId,
        token: event.token,
      );
      emit(AllUserChatsLoaded(userChats: chats));
    }

    Future<void> onFetchPublicUserchats(
        FetchPublicUserChats event, Emitter<PublicUserChatsLoaded> emit) async {
      final chats = await fetchPublicChats(
        userId: event.userId,
        token: event.token,
      );
      emit(PublicUserChatsLoaded(userChats: chats));
    }

    Future<void> onFetchPrivateUserChats(FetchPrivateUserChats event,
        Emitter<PrivateUserChatsLoaded> emit) async {
      final chats = await fetchPrivateChats(
        userId: event.userId,
        token: event.token,
      );
      emit(PrivateUserChatsLoaded(userChats: chats));
    }

    Future<void> onUpdateChats(
        UpdateUserChat event, Emitter<UserChatUpdated> emit) async {
      if (event.updateAction.actionName == 'updateChatName') {
        await event.updateAction.updateChatName(
            userId: event.userId,
            chatId: event.chatId,
            token: event.token,
            updatedChatName: event.updateAction.updatedChatName);
      } else if (event.updateAction.actionName == 'updateChatMembers') {
        await event.updateAction.updateChatMembers(
            userId: event.userId,
            chatId: event.chatId,
            token: event.token,
            newChatMembers: event.updateAction.newChatMembers);
      }
    }
  }
}
