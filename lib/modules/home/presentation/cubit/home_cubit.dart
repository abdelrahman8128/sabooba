import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_jobs_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetJobsUseCase getJobsUseCase;

  HomeCubit({required this.getJobsUseCase}) : super(HomeInitial());

  Future<void> loadJobs({
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
  }) async {
    emit(HomeLoading());

    final result = await getJobsUseCase(
      category: category,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortBy: sortBy,
    );

    result.fold(
      (error) => emit(HomeError(message: error)),
      (jobs) => emit(
        HomeLoaded(
          jobs: jobs,
          selectedCategory: category,
          minPrice: minPrice,
          maxPrice: maxPrice,
          sortBy: sortBy,
        ),
      ),
    );
  }

  void applyFilters({
    String? category,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
  }) {
    loadJobs(
      category: category,
      minPrice: minPrice,
      maxPrice: maxPrice,
      sortBy: sortBy,
    );
  }

  void clearFilters() {
    loadJobs();
  }
}
