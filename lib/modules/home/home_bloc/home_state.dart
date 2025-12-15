part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<JobModel> jobs;
  final String? selectedCategory;
  final double? minPrice;
  final double? maxPrice;
  final String? sortBy;
  final String? searchQuery;

  const HomeLoaded({
    required this.jobs,
    this.selectedCategory,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [
    jobs,
    selectedCategory,
    minPrice,
    maxPrice,
    sortBy,
    searchQuery,
  ];

  HomeLoaded copyWith({
    List<JobModel>? jobs,
    String? selectedCategory,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
    String? searchQuery,
  }) {
    return HomeLoaded(
      jobs: jobs ?? this.jobs,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
