import 'package:equatable/equatable.dart';

class ChatModel extends Equatable {
  final String id;
  final String userName;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool isOnline;
  final int unreadCount;

  const ChatModel({
    required this.id,
    required this.userName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.isOnline,
    this.unreadCount = 0,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as String,
      userName: json['userName'] as String,
      lastMessage: json['lastMessage'] as String,
      lastMessageTime: DateTime.parse(json['lastMessageTime'] as String),
      isOnline: json['isOnline'] as bool,
      unreadCount: json['unreadCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime.toIso8601String(),
      'isOnline': isOnline,
      'unreadCount': unreadCount,
    };
  }

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
