import 'package:bloc/bloc.dart';
import 'package:cybersage/Models/chat_model.dart';
import 'package:cybersage/Services/Chats/fetch_chats.dart';
import 'package:cybersage/Services/Chats/update_chats.dart';
import 'package:meta/meta.dart';

part 'userchats_event.dart';
part 'userchats_state.dart';

class UserchatsBloc extends Bloc<UserchatsEvent, UserchatsState> {
  UserchatsBloc() : super(UserchatsInitial()) {
    Future<void> onFetchUserchats(
        FetchUserchats event, Emitter<UserchatsState> emit) async {
      // print('onFetchUserchats');
      final chats = await fetchChats(userId: event.userId, token: event.token);
      print(chats.map((c) => c.toJson()).toList());

      emit(UserchatsLoaded(userchats: chats));
    }

    Future<dynamic> onUpdateChats(
        UpdateUserchats event, Emitter<UserchatsState> emit) async {
      print('onUpdatechats');
      final upchats = await updateChats(
          roomName: event.roomName, userId: event.userId, token: event.token);

      final chats = await fetchChats(userId: event.userId, token: event.token);

      emit(UserchatsLoaded(userchats: chats));
    }

    on<FetchUserchats>(onFetchUserchats);

    on<UpdateUserchats>(onUpdateChats);
  }
}
