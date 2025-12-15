import 'package:dartz/dartz.dart';
import '../entities/job_entity.dart';

abstract class JobsRepository {
  Future<Either<String, List<JobEntity>>> getJobs({
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
  });
}
