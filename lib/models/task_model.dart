enum TaskStatus { pending, completed, denied }

enum TaskPriority { low, medium, high }

class Task {
  final String id;
  final String title;
  final String description;
  final DateTime assignedDate;
  final DateTime deadline;
  final TaskPriority priority;
  final TaskStatus status;
  final String instructions;
  
  // Completion details
  final String? completionUrl;
  final String? completionNotes;
  final String? denyReason;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.assignedDate,
    required this.deadline,
    required this.priority,
    required this.status,
    required this.instructions,
    this.completionUrl,
    this.completionNotes,
    this.denyReason,
  });

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? assignedDate,
    DateTime? deadline,
    TaskPriority? priority,
    TaskStatus? status,
    String? instructions,
    String? completionUrl,
    String? completionNotes,
    String? denyReason,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      assignedDate: assignedDate ?? this.assignedDate,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      instructions: instructions ?? this.instructions,
      completionUrl: completionUrl ?? this.completionUrl,
      completionNotes: completionNotes ?? this.completionNotes,
      denyReason: denyReason ?? this.denyReason,
    );
  }
}
