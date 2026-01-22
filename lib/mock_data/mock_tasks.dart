import '../models/task_model.dart';

class MockTaskData {
  static final List<Task> tasks = [
    Task(
      id: '1',
      title: 'Complete Project Proposal',
      description: 'Finalize and submit the Q1 project proposal',
      assignedDate: DateTime(2026, 1, 15),
      deadline: DateTime(2026, 1, 25, 17, 0),
      priority: TaskPriority.high,
      status: TaskStatus.pending,
      instructions: '''
- Review previous quarter feedback
- Include budget estimates
- Add risk assessment section
- Prepare presentation slides
- Submit via project management system
      ''',
    ),
    Task(
      id: '2',
      title: 'Review Team Feedback',
      description: 'Go through and consolidate feedback from team members',
      assignedDate: DateTime(2026, 1, 16),
      deadline: DateTime(2026, 1, 28, 14, 0),
      priority: TaskPriority.medium,
      status: TaskStatus.pending,
      instructions: '''
- Collect feedback from all team members
- Categorize by importance
- Create summary document
- Schedule discussion meeting
      ''',
    ),
    Task(
      id: '3',
      title: 'Update Documentation',
      description: 'Update project documentation with latest changes',
      assignedDate: DateTime(2026, 1, 10),
      deadline: DateTime(2026, 1, 22, 16, 30),
      priority: TaskPriority.low,
      status: TaskStatus.completed,
      instructions: 'Update tech stack and deployment procedure',
      completionUrl: 'https://docs.example.com/project-v2',
      completionNotes: 'Completed all documentation updates. Added new deployment section.',
    ),
    Task(
      id: '4',
      title: 'Client Meeting Preparation',
      description: 'Prepare presentation for client meeting',
      assignedDate: DateTime(2026, 1, 18),
      deadline: DateTime(2026, 1, 23, 10, 0),
      priority: TaskPriority.high,
      status: TaskStatus.denied,
      instructions: 'Prepare slides and demo for client presentation',
      denyReason: 'Meeting rescheduled to February. Will complete after new date is confirmed.',
    ),
    Task(
      id: '5',
      title: 'Code Review Submission',
      description: 'Complete code review for latest pull requests',
      assignedDate: DateTime(2026, 1, 17),
      deadline: DateTime(2026, 1, 26, 18, 0),
      priority: TaskPriority.medium,
      status: TaskStatus.pending,
      instructions: '''
- Review pull requests in dev branch
- Check code quality and standards
- Provide constructive feedback
- Approve or request changes
      ''',
    ),
    Task(
      id: '6',
      title: 'Training Material Creation',
      description: 'Create training materials for new team members',
      assignedDate: DateTime(2026, 1, 12),
      deadline: DateTime(2026, 1, 29, 15, 0),
      priority: TaskPriority.low,
      status: TaskStatus.pending,
      instructions: 'Create comprehensive onboarding guide and training videos',
    ),
  ];
}
