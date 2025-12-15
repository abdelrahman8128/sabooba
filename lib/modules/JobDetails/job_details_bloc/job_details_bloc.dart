import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  JobDetailsBloc() : super(JobDetailsInitial()) {
    on<ApplyForJobEvent>(_onApplyForJob);
  }

  Future<void> _onApplyForJob(
    ApplyForJobEvent event,
    Emitter<JobDetailsState> emit,
  ) async {
    emit(JobDetailsApplying());

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Simulate success
    emit(JobDetailsApplied());

    // Reset to initial state after showing success
    await Future.delayed(const Duration(seconds: 2));
    emit(JobDetailsInitial());
  }
}
