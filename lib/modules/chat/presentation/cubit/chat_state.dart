import 'package:equatable/equatable.dart';
import '../../domain/entities/chat_entity.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<ChatEntity> chats;

  const ChatLoaded({required this.chats});

  @override
  List<Object?> get props => [chats];
}

class ChatError extends ChatState {
  final String message;

  const ChatError({required this.message});

  @override
  List<Object?> get props => [message];
}
