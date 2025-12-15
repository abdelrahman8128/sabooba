import 'package:equatable/equatable.dart';

abstract class JobDetailsState extends Equatable {
  const JobDetailsState();

  @override
  List<Object?> get props => [];
}

class JobDetailsInitial extends JobDetailsState {}

class JobDetailsApplying extends JobDetailsState {}

class JobDetailsApplied extends JobDetailsState {}

class JobDetailsError extends JobDetailsState {
  final String message;

  const JobDetailsError({required this.message});

  @override
  List<Object?> get props => [message];
}
