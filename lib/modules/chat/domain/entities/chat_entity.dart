import 'package:equatable/equatable.dart';

class ChatEntity extends Equatable {
  final String id;
  final String userName;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool isOnline;
  final int unreadCount;

  const ChatEntity({
    required this.id,
    required this.userName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    this.unreadCount = 0,
  });

  @override
  List<Object?> get props => [
    id,
    userName,
    lastMessage,
    lastMessageTime,
    isOnline,
    unreadCount,
  ];
}
