import '../../domain/entities/job_entity.dart';

class JobModel extends JobEntity {
  const JobModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.budget,
    required super.postedBy,
    required super.deadline,
    required super.postedDate,
    required super.requirements,
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
}
