import 'package:flutter_bloc/flutter_bloc.dart';
import 'job_details_state.dart';

class JobDetailsCubit extends Cubit<JobDetailsState> {
  JobDetailsCubit() : super(JobDetailsInitial());

  Future<void> applyForJob(String jobId) async {
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
