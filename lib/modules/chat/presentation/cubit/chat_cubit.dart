import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_chats_usecase.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatsUseCase getChatsUseCase;

  ChatCubit({required this.getChatsUseCase}) : super(ChatInitial());

  Future<void> loadChats() async {
    emit(ChatLoading());

    final result = await getChatsUseCase();

    result.fold(
      (error) => emit(ChatError(message: error)),
      (chats) => emit(ChatLoaded(chats: chats)),
    );
  }
}
