import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task_model.dart';
import '../../providers/task_provider.dart';
import '../../utils/app_theme_v2.dart';
import '../../utils/helpers.dart';
import '../../widgets/task_widgets.dart';
import '../../widgets/premium_widgets.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;

  const TaskDetailScreen({required this.task, Key? key}) : super(key: key);

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late Task _currentTask;
  final _urlController = TextEditingController();
  final _notesController = TextEditingController();
  final _reasonController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _currentTask = widget.task;
    _urlController.text = _currentTask.completionUrl ?? '';
    _notesController.text = _currentTask.completionNotes ?? '';
    _reasonController.text = _currentTask.denyReason ?? '';
  }

  @override
  void dispose() {
    _urlController.dispose();
    _notesController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.background,
        title: Text(
          'Task Details',
          style: textTheme.headlineSmall?.copyWith(
            color: colors.onBackground,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: colors.background,
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          _currentTask = taskProvider.getTaskById(widget.task.id) ?? _currentTask;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(colors, textTheme),
                const SizedBox(height: AppSpacing.lg),

                // Status information
                if (_currentTask.status != TaskStatus.pending)
                  _buildStatusSection(colors, textTheme),

                // Task details
                _buildDetailsSection(colors, textTheme),
                const SizedBox(height: AppSpacing.lg),

                // Instructions
                _buildInstructionsSection(colors, textTheme),
                const SizedBox(height: AppSpacing.lg),

                // Action buttons
                if (_currentTask.status == TaskStatus.pending)
                  _buildActionButtons(context, taskProvider, colors)
                else
                  _buildResetButton(context, taskProvider, colors),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(ColorScheme colors, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                _currentTask.title,
                style: textTheme.headlineMedium,
              ),
            ),
            const SizedBox(width: AppSpacing.lg),
            Column(
              children: [
                PriorityBadge(priority: _currentTask.priority, height: 32),
                const SizedBox(height: AppSpacing.sm),
                StatusBadge(status: _currentTask.status, height: 32),
              ],
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          _currentTask.description,
          style: textTheme.bodyLarge?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusSection(ColorScheme colors, TextTheme textTheme) {
    final isCompleted = _currentTask.status == TaskStatus.completed;
    final statusColor = isCompleted ? colors.tertiary : colors.error;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: statusColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: statusColor.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isCompleted) ...[
            Text(
              'Completion Details',
              style: textTheme.titleMedium?.copyWith(
                color: statusColor,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            _buildDetailItem(textTheme, colors, 'URL', _currentTask.completionUrl ?? 'N/A'),
            const SizedBox(height: AppSpacing.lg),
            _buildDetailItem(textTheme, colors, 'Notes', _currentTask.completionNotes ?? 'N/A'),
          ] else ...[
            Text(
              'Denial Reason',
              style: textTheme.titleMedium?.copyWith(
                color: statusColor,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              _currentTask.denyReason ?? 'N/A',
              style: textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailItem(TextTheme textTheme, ColorScheme colors, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: colors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildDetailsSection(ColorScheme colors, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: colors.primaryContainer.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: colors.outline,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Information',
            style: textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildInfoRow(
            colors: colors,
            textTheme: textTheme,
            icon: Icons.calendar_today,
            label: 'Assigned',
            value: DateFormatter.formatDate(_currentTask.assignedDate),
          ),
          const SizedBox(height: AppSpacing.lg),
          _buildInfoRow(
            colors: colors,
            textTheme: textTheme,
            icon: Icons.schedule,
            label: 'Deadline',
            value: DateFormatter.formatDateTime(_currentTask.deadline),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required ColorScheme colors,
    required TextTheme textTheme,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: colors.primary, size: 20),
        const SizedBox(width: AppSpacing.lg),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.labelSmall?.copyWith(
                  color: colors.onSurfaceVariant,
                ),
              ),
              Text(
                value,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInstructionsSection(ColorScheme colors, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions',
          style: textTheme.titleMedium,
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: colors.outline,
              width: 1,
            ),
          ),
          child: Text(
            _currentTask.instructions,
            style: textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, TaskProvider taskProvider, ColorScheme colors) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _showCompleteDialog(context, taskProvider),
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.tertiary,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            ),
            child: const Text('Mark as Completed'),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => _showDenyDialog(context, taskProvider),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colors.error, width: 2),
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            ),
            child: Text(
              'Mark as Denied',
              style: TextStyle(color: colors.error),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResetButton(BuildContext context, TaskProvider taskProvider, ColorScheme colors) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          taskProvider.resetTask(_currentTask.id);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Task reset to pending'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: colors.secondary, width: 2),
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        ),
        child: Text(
          'Reset to Pending',
          style: TextStyle(color: colors.secondary),
        ),
      ),
    );
  }

  void _showCompleteDialog(BuildContext context, TaskProvider taskProvider) {
    showDialog(
      context: context,
      builder: (dialogContext) => PremiumFormModal(
        title: 'Mark Task as Completed',
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _urlController,
                  decoration: InputDecoration(
                    labelText: 'URL (Required)',
                    hintText: 'https://example.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                  ),
                  validator: ValidationHelper.validateUrl,
                ),
                const SizedBox(height: AppSpacing.lg),
                TextFormField(
                  controller: _notesController,
                  decoration: InputDecoration(
                    labelText: 'Notes (Required)',
                    hintText: 'Describe your completion...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                  ),
                  maxLines: 3,
                  validator: ValidationHelper.validateNotes,
                ),
                const SizedBox(height: AppSpacing.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    'Please provide the completion URL and detailed notes. Your response will be reviewed by the administrator.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                taskProvider.markTaskCompleted(
                  _currentTask.id,
                  url: _urlController.text,
                  notes: _notesController.text,
                );
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task marked as completed'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showDenyDialog(BuildContext context, TaskProvider taskProvider) {
    showDialog(
      context: context,
      builder: (dialogContext) => PremiumFormModal(
        title: 'Mark Task as Denied',
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _reasonController,
                  decoration: InputDecoration(
                    labelText: 'Reason for Denial (Required)',
                    hintText: 'Explain why you are denying this task...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                    ),
                  ),
                  maxLines: 4,
                  validator: ValidationHelper.validateReason,
                ),
                const SizedBox(height: AppSpacing.lg),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: Text(
                    'Please provide a detailed reason for denying this task. This will be communicated to the task owner.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                taskProvider.markTaskDenied(_currentTask.id, _reasonController.text);
                Navigator.pop(dialogContext);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Task marked as denied'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Deny'),
          ),
        ],
      ),
    );
  }
}
