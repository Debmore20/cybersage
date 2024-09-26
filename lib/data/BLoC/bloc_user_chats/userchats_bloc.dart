import 'package:bloc/bloc.dart';
import 'package:cybersage/data/BLoC/bloc_user_chats/user_actions_model.dart';
import 'package:cybersage/data/Models/chat_model.dart';

import 'package:cybersage/services/services_exports.dart';
import 'package:meta/meta.dart';

part 'userchats_event.dart';
part 'userchats_state.dart';

class UserchatsBloc extends Bloc<UserChatsEvent, UserChatsState> {
  UserchatsBloc() : super(UserChatsInitial()) {
    on<CreatePublicUserChat>(_onCreatePublicUserchats);
    on<CreatePrivateUserChat>(_onCreatePrivateUserchats);
    on<FetchAllUserChats>(_onFetchAllUserchats);
    on<FetchPublicUserChats>(_onFetchPublicUserchats);
    on<FetchPrivateUserChats>(_onFetchPrivateUserChats);
    on<UpdateUserChat>(_onUpdateChats);
    on<DeleteUserChat>(_onDeleteChats);
  }
  Future<void> _onCreatePublicUserchats(
      CreatePublicUserChat event, Emitter<UserChatsState> emit) async {
    emit(UserChatsLoading());
    try {
      final response =
          await createNewPublicChat(event.chatName, event.userId, event.token);
      final chats = await fetchPublicChats(
        userId: event.userId,
        token: event.token,
      );
      emit(PrivateUserChatCreated(
          userChats: chats, message: response['message']));
    } catch (e) {
      emit(UserChatsError(message: e.toString()));
    }
  }

  Future<void> _onCreatePrivateUserchats(
      CreatePrivateUserChat event, Emitter<UserChatsState> emit) async {
    emit(UserChatsLoading());
    try {
      final response = await createNewPrivateChat(
        event.chatName,
        event.userId,
        event.token,
      );
      final chats = await fetchPrivateChats(
        userId: event.userId,
        token: event.token,
      );
      emit(PrivateUserChatCreated(
          userChats: chats, message: response['message']));
    } catch (e) {
      emit(UserChatsError(message: e.toString()));
    }
  }

  Future<void> _onFetchAllUserchats(
      FetchAllUserChats event, Emitter<UserChatsState> emit) async {
    emit(UserChatsLoading());
    try {
      final chats = await fetchAllChats(
        userId: event.userId,
        token: event.token,
      );
      emit(AllUserChatsLoaded(userChats: chats));
    } catch (e) {
      emit(UserChatsError(message: e.toString()));
    }
  }

  Future<void> _onFetchPublicUserchats(
      FetchPublicUserChats event, Emitter<UserChatsState> emit) async {
    emit(UserChatsLoading());
    try {
      final chats = await fetchPublicChats(
        userId: event.userId,
        token: event.token,
      );
      emit(PublicUserChatsLoaded(userChats: chats));
    } catch (e) {
      emit(UserChatsError(message: e.toString()));
    }
  }

  Future<void> _onFetchPrivateUserChats(
      FetchPrivateUserChats event, Emitter<UserChatsState> emit) async {
    emit(UserChatsLoading());
    try {
      final chats = await fetchPrivateChats(
        userId: event.userId,
        token: event.token,
      );
      emit(PrivateUserChatsLoaded(userChats: chats));
    } catch (e) {
      emit(UserChatsError(message: e.toString()));
    }
  }

  Future<void> _onUpdateChats(
      UpdateUserChat event, Emitter<UserChatsState> emit) async {
    emit(UserChatsLoading());
    try {
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
    } catch (e) {
      emit(UserChatsError(message: e.toString()));
    }
  }

  Future<void> _onDeleteChats(
      DeleteUserChat event, Emitter<UserChatsState> emit) async {
    emit(UserChatsLoading());
    try {
      final response = await deleteChat(
        userId: event.userId,
        chatId: event.chatId,
        token: event.token,
      );
      emit(UserChatDeleted(message: response));
    } catch (e) {
      emit(UserChatsError(message: e.toString()));
    }
  }
}
