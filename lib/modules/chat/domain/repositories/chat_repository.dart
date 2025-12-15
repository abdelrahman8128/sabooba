import 'package:dartz/dartz.dart';
import '../entities/chat_entity.dart';

abstract class ChatRepository {
  Future<Either<String, List<ChatEntity>>> getChats();
}
