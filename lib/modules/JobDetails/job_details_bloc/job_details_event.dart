part of 'job_details_bloc.dart';

abstract class JobDetailsEvent extends Equatable {
  const JobDetailsEvent();

  @override
  List<Object?> get props => [];
}

class ApplyForJobEvent extends JobDetailsEvent {
  final String jobId;

  const ApplyForJobEvent({required this.jobId});

  @override
  List<Object?> get props => [jobId];
}
