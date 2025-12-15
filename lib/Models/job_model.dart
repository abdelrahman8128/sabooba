import 'package:equatable/equatable.dart';

class JobModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final double budget;
  final String postedBy;
  final DateTime deadline;
  final DateTime postedDate;
  final List<String> requirements;

  const JobModel({
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

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      budget: (json['budget'] as num).toDouble(),
      postedBy: json['postedBy'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      postedDate: DateTime.parse(json['postedDate'] as String),
      requirements: List<String>.from(json['requirements'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'budget': budget,
      'postedBy': postedBy,
      'deadline': deadline.toIso8601String(),
      'postedDate': postedDate.toIso8601String(),
      'requirements': requirements,
    };
  }

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
