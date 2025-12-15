import '../../Models/job_model.dart';

abstract class JobsRepository {
  Future<List<JobModel>> getJobs({
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
  });
}

class JobsRepositoryImpl implements JobsRepository {
  final JobsLocalDataSource localDataSource;

  JobsRepositoryImpl({required this.localDataSource});

  @override
  Future<List<JobModel>> getJobs({
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
  }) async {
    try {
      final jobs = await localDataSource.getJobs();

      // Filter by category
      var filteredJobs = jobs.where((job) {
        if (category != null && category != 'All Categories') {
          return job.category == category;
        }
        return true;
      }).toList();

      // Filter by price range
      if (minPrice != null) {
        filteredJobs = filteredJobs
            .where((job) => job.budget >= minPrice)
            .toList();
      }
      if (maxPrice != null) {
        filteredJobs = filteredJobs
            .where((job) => job.budget <= maxPrice)
            .toList();
      }

      // Sort
      if (sortBy != null) {
        switch (sortBy) {
          case 'Price: Low to High':
            filteredJobs.sort((a, b) => a.budget.compareTo(b.budget));
            break;
          case 'Price: High to Low':
            filteredJobs.sort((a, b) => b.budget.compareTo(a.budget));
            break;
          case 'Newest First':
            filteredJobs.sort((a, b) => b.postedDate.compareTo(a.postedDate));
            break;
          case 'Oldest First':
            filteredJobs.sort((a, b) => a.postedDate.compareTo(b.postedDate));
            break;
        }
      }

      return filteredJobs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

abstract class JobsLocalDataSource {
  Future<List<JobModel>> getJobs();
}
