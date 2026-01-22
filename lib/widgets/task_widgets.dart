import 'package:flutter/material.dart';
import '../utils/app_theme_v2.dart';
import '../models/task_model.dart';
import '../utils/helpers.dart';

/// Perfectly aligned badge for Priority - Fixed height, padding, radius
class PriorityBadge extends StatelessWidget {
  final TaskPriority priority;
  final double? height;

  const PriorityBadge({required this.priority, this.height = 32});

  @override
  Widget build(BuildContext context) {
    final color = _getPriorityColor(context);
    final label = priority.toString().split('.').last.capitalize();

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ) ?? TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  Color _getPriorityColor(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    switch (priority) {
      case TaskPriority.high:
        return colors.error;
      case TaskPriority.medium:
        return Color(0xFFF59E0B); // Keep amber for medium
      case TaskPriority.low:
        return colors.tertiary;
    }
  }
}

/// Perfectly aligned badge for Status - Fixed height, padding, radius
class StatusBadge extends StatelessWidget {
  final TaskStatus status;
  final double? height;

  const StatusBadge({required this.status, this.height = 32});

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(context);
    final label = status.toString().split('.').last.capitalize();
    final icon = _getStatusIcon();

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ) ?? TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    switch (status) {
      case TaskStatus.pending:
        return colors.primary;
      case TaskStatus.completed:
        return colors.tertiary;
      case TaskStatus.denied:
        return colors.error;
    }
  }

  IconData _getStatusIcon() {
    switch (status) {
      case TaskStatus.pending:
        return Icons.schedule;
      case TaskStatus.completed:
        return Icons.check_circle_outline;
      case TaskStatus.denied:
        return Icons.cancel_outlined;
    }
  }
}

class TaskCard extends StatefulWidget {
  final Task task;
  final VoidCallback onTap;

  const TaskCard({
    required this.task,
    required this.onTap,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          transform: _isHovered ? Matrix4.translationValues(0, -4, 0) : Matrix4.identity(),
          child: Container(
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(
                color: _isHovered 
                  ? colors.primary.withOpacity(0.3) 
                  : colors.outline,
                width: 1.5,
              ),
              boxShadow: _isHovered
                ? [AppShadows.hover(colors)]
                : [AppShadows.base(colors)],
            ),
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title & Status Row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.task.title,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            widget.task.description,
                            style: textTheme.bodySmall?.copyWith(
                              color: colors.onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.lg),
                    StatusBadge(status: widget.task.status, height: 32),
                  ],
                ),
                
                const SizedBox(height: AppSpacing.lg),
                
                // Footer: Deadline + Priority
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16,
                          color: colors.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          DateFormatter.formatDeadline(widget.task.deadline),
                          style: textTheme.bodySmall?.copyWith(
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    PriorityBadge(priority: widget.task.priority, height: 32),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
