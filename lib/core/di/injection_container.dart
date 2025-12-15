import 'package:get_it/get_it.dart';
import 'package:saboba/Network/data_sources/chat_local_datasource.dart';
import 'package:saboba/Network/data_sources/jobs_local_datasource.dart';
import 'package:saboba/Network/repositories/chat_repository.dart';
import 'package:saboba/Network/repositories/jobs_repository.dart';
import 'package:saboba/modules/chat/domain/usecases/get_chats_usecase.dart';
import 'package:saboba/modules/chat/presentation/cubit/chat_cubit.dart';
import 'package:saboba/modules/home/presentation/cubit/home_cubit.dart';
import 'package:saboba/modules/job_details/presentation/cubit/job_details_cubit.dart';

import '../../modules/home/domain/usecases/get_jobs_usecase.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Cubits
  sl.registerFactory(() => HomeCubit(getJobsUseCase: sl()));
  sl.registerFactory(() => JobDetailsCubit());
  sl.registerFactory(() => ChatCubit(getChatsUseCase: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetJobsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetChatsUseCase(repository: sl()));

  // Repositories
  sl.registerLazySingleton<JobsRepository>(
    () => JobsRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(localDataSource: sl()),
  );

  // Data Sources
  sl.registerLazySingleton<JobsLocalDataSource>(
    () => JobsLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<ChatLocalDataSource>(
    () => ChatLocalDataSourceImpl(),
  );
  
}
