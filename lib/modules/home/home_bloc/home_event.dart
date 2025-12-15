part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadJobsEvent extends HomeEvent {
  final String? category;
  final double? minPrice;
  final double? maxPrice;
  final String? sortBy;

  const LoadJobsEvent({
    this.category,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
  });

  @override
  List<Object?> get props => [category, minPrice, maxPrice, sortBy];
}

class ApplyFiltersEvent extends HomeEvent {
  final String? category;
  final double? minPrice;
  final double? maxPrice;
  final String? sortBy;

  const ApplyFiltersEvent({
    this.category,
    this.minPrice,
    this.maxPrice,
    this.sortBy,
  });

  @override
  List<Object?> get props => [category, minPrice, maxPrice, sortBy];
}

class SearchJobsEvent extends HomeEvent {
  final String query;

  const SearchJobsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class ClearFiltersEvent extends HomeEvent {}
