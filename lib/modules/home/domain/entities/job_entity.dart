import 'package:equatable/equatable.dart';

class JobEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final double budget;
  final String postedBy;
  final DateTime deadline;
  final DateTime postedDate;
  final List<String> requirements;

  const JobEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.budget,
    required this.postedBy,
    required this.deadline,
    required this.postedDate,
    required this.requirements,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    budget,
    postedBy,
    deadline,
    postedDate,
    requirements,
  ];
}
