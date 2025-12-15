import 'package:equatable/equatable.dart';
import '../../domain/entities/job_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<JobEntity> jobs;
  final String? selectedCategory;
  final double? minPrice;
  final double? maxPrice;
  final String? sortBy;

  const HomeLoaded({
    required this.jobs,
    this.selectedCategory,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
  });

  @override
  List<Object?> get props => [
    jobs,
    selectedCategory,
    minPrice,
    maxPrice,
    sortBy,
  ];

  HomeLoaded copyWith({
    List<JobEntity>? jobs,
    String? selectedCategory,
    double? minPrice,
    double? maxPrice,
    String? sortBy,
  }) {
    return HomeLoaded(
      jobs: jobs ?? this.jobs,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}
