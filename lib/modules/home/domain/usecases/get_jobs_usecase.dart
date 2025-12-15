import 'package:dartz/dartz.dart';
import '../entities/job_entity.dart';
import '../repositories/jobs_repository.dart';

class GetJobsUseCase {
  final JobsRepository repository;

  GetJobsUseCase({required this.repository});

  Future<Either<String, List<JobEntity>>> call({
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
  }) async {
    return await repository.getJobs(
      category: category,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortBy: sortBy,
    );
  }
}
