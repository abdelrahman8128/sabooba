import 'package:dartz/dartz.dart';
import '../../domain/entities/chat_entity.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_local_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatLocalDataSource localDataSource;

  ChatRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<String, List<ChatEntity>>> getChats() async {
    try {
      final chats = await localDataSource.getChats();
      return Right(chats);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
