import '../../Models/chat_model.dart';

abstract class ChatRepository {
  Future<List<ChatModel>> getChats();
}

class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDataSource localDataSource;

  ChatRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ChatModel>> getChats() async {
    try {
      final chats = await localDataSource.getChats();
      return chats;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

abstract class ChatLocalDataSource {
  Future<List<ChatModel>> getChats();
}
