import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Models/job_model.dart';
import '../../../Network/repositories/jobs_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final JobsRepository jobsRepository;
  List<JobModel> _allJobs = [];

  HomeBloc({required this.jobsRepository}) : super(HomeInitial()) {
    on<LoadJobsEvent>(_onLoadJobs);
    on<ApplyFiltersEvent>(_onApplyFilters);
    on<ClearFiltersEvent>(_onClearFilters);
    on<SearchJobsEvent>(_onSearchJobs);
  }

  Future<void> _onLoadJobs(LoadJobsEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());

    try {
      final jobs = await jobsRepository.getJobs(
        category: event.category,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        sortBy: event.sortBy,
      );

      _allJobs = jobs;

      emit(
        HomeLoaded(
          jobs: jobs,
          selectedCategory: event.category,
          minPrice: event.minPrice,
          maxPrice: event.maxPrice,
          sortBy: event.sortBy,
        ),
      );
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> _onSearchJobs(
    SearchJobsEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;

      if (event.query.isEmpty) {
        // Show all jobs if search is cleared
        emit(currentState.copyWith(jobs: _allJobs, searchQuery: null));
      } else {
        // Filter jobs by title
        final filteredJobs = _allJobs.where((job) {
          return job.title.toLowerCase().contains(event.query.toLowerCase());
        }).toList();

        emit(
          currentState.copyWith(jobs: filteredJobs, searchQuery: event.query),
        );
      }
    }
  }

  Future<void> _onApplyFilters(
    ApplyFiltersEvent event,
    Emitter<HomeState> emit,
  ) async {
    add(
      LoadJobsEvent(
        category: event.category,
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
        sortBy: event.sortBy,
      ),
    );
  }

  Future<void> _onClearFilters(
    ClearFiltersEvent event,
    Emitter<HomeState> emit,
  ) async {
    add(const LoadJobsEvent());
  }
}
