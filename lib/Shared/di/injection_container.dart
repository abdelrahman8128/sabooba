import 'package:get_it/get_it.dart';
import '../../Modules/Home/home_bloc/home_bloc.dart';
import '../../Modules/JobDetails/job_details_bloc/job_details_bloc.dart';
import '../../Modules/Chat/chat_bloc/chat_bloc.dart';
import '../../Network/repositories/jobs_repository.dart';
import '../../Network/repositories/chat_repository.dart';
import '../../Network/data_sources/jobs_local_datasource.dart';
import '../../Network/data_sources/chat_local_datasource.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoCs
  sl.registerFactory(() => HomeBloc(jobsRepository: sl()));
  sl.registerFactory(() => JobDetailsBloc());
  sl.registerFactory(() => ChatBloc(chatRepository: sl()));

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
