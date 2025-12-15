import '../models/chat_model.dart';

abstract class ChatLocalDataSource {
  Future<List<ChatModel>> getChats();
}

class ChatLocalDataSourceImpl implements ChatLocalDataSource {
  @override
  Future<List<ChatModel>> getChats() async {
    // Simulating API delay
    await Future.delayed(const Duration(milliseconds: 300));

    // Hardcoded chats data for testing
    final now = DateTime.now();
    return [
      ChatModel(
        id: '1',
        userName: 'John Smith',
        lastMessage: 'Hi, I saw your application for the Flutter project.',
        lastMessageTime: now.subtract(const Duration(minutes: 5)),
        isOnline: true,
        unreadCount: 2,
      ),
      ChatModel(
        id: '2',
        userName: 'Sarah Johnson',
        lastMessage: 'Can you start the WordPress project tomorrow?',
        lastMessageTime: now.subtract(const Duration(hours: 2)),
        isOnline: true,
        unreadCount: 1,
      ),
      ChatModel(
        id: '3',
        userName: 'Mike Chen',
        lastMessage: 'Thanks for the logo designs, they look great!',
        lastMessageTime: now.subtract(const Duration(hours: 5)),
        isOnline: false,
        unreadCount: 0,
      ),
      ChatModel(
        id: '4',
        userName: 'Emma Wilson',
        lastMessage: 'When can you submit the first drafts?',
        lastMessageTime: now.subtract(const Duration(days: 1)),
        isOnline: false,
        unreadCount: 0,
      ),
      ChatModel(
        id: '5',
        userName: 'David Brown',
        lastMessage: 'The social media strategy looks perfect!',
        lastMessageTime: now.subtract(const Duration(days: 2)),
        isOnline: true,
        unreadCount: 0,
      ),
    ];
  }
}
