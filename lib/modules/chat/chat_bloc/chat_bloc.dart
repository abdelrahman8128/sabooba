import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Models/chat_model.dart';
import '../../../Network/repositories/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;

  ChatBloc({required this.chatRepository}) : super(ChatInitial()) {
    on<LoadChatsEvent>(_onLoadChats);
  }

  Future<void> _onLoadChats(
    LoadChatsEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(ChatLoading());

    try {
      final chats = await chatRepository.getChats();
      emit(ChatLoaded(chats: chats));
    } catch (e) {
      emit(ChatError(message: e.toString()));
    }
  }
}
