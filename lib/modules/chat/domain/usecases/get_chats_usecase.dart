import 'package:dartz/dartz.dart';
import '../entities/chat_entity.dart';
import '../repositories/chat_repository.dart';

class GetChatsUseCase {
  final ChatRepository repository;

  GetChatsUseCase({required this.repository});

  Future<Either<String, List<ChatEntity>>> call() async {
    return await repository.getChats();
  }
}
