import 'package:bloc/bloc.dart';
import 'package:cybersage/BLoC/bloc_user_chats/user_actions_model.dart';
import 'package:cybersage/Models/chat_model.dart';
import 'package:cybersage/Services/Chats/fetch_chats.dart';
import 'package:cybersage/Services/Chats/update_chats.dart';
import 'package:cybersage/Services/services_exports.dart';
import 'package:meta/meta.dart';

part 'userchats_event.dart';
part 'userchats_state.dart';

class UserchatsBloc extends Bloc<UserchatsEvent, UserchatsState> {
  UserchatsBloc() : super(UserchatsInitial()) {
    Future<void> onFetchUserchats(
        FetchUserchats event, Emitter<UserchatsState> emit) async {
      // print('onFetchUserchats');
      final chats = await fetchChats(
          userId: event.userId, token: event.token, chatType: event.chatType);

      emit(UserchatsLoaded(userchats: chats));
    }

    Future<void> onCreateChat(
        CreateUserchats event, Emitter<UserchatsState> emit) async {
      emit(UserchatsLoading());
      try {
        final response =
            await createChat(event.chatName, event.userId, event.chatType);
        final chats = await fetchChats(
            userId: event.userId, token: event.token, chatType: event.chatType);
        emit(UserchatsCreated(message: response['message'], userchats: chats));
      } catch (e) {
        emit(UserchatsError(message: 'Failed to create room'));
      }
    }

    on<CreateUserchats>(onCreateChat);

    on<FetchUserchats>(onFetchUserchats);

    on<UpdateUserchats>(onUpdateChats);
  }
}
