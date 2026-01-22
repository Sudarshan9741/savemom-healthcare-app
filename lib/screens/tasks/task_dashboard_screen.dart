import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task_model.dart';
import '../../providers/task_provider.dart';
import '../../utils/app_theme_v2.dart';
import '../../utils/page_transitions.dart';
import '../../widgets/task_widgets.dart';
import '../../widgets/premium_widgets.dart';
import 'task_detail_screen.dart';

class TaskDashboardScreen extends StatefulWidget {
  const TaskDashboardScreen({Key? key}) : super(key: key);

  @override
  State<TaskDashboardScreen> createState() => _TaskDashboardScreenState();
}

class _TaskDashboardScreenState extends State<TaskDashboardScreen> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colors.background,
        title: Text(
          'Task Dashboard',
          style: textTheme.headlineSmall?.copyWith(
            color: colors.onBackground,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: colors.background,
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, _) {
          return Column(
            children: [
              // Tab buttons
              Container(
                color: colors.background,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.lg,
                  ),
                  child: Row(
                    children: [
                      _buildTabButton(
                        label: 'Pending',
                        count: taskProvider.pendingTasks.length,
                        isActive: _selectedTab == 0,
                        onTap: () => setState(() => _selectedTab = 0),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      _buildTabButton(
                        label: 'Completed',
                        count: taskProvider.completedTasks.length,
                        isActive: _selectedTab == 1,
                        onTap: () => setState(() => _selectedTab = 1),
                      ),
                      const SizedBox(width: AppSpacing.lg),
                      _buildTabButton(
                        label: 'Denied',
                        count: taskProvider.deniedTasks.length,
                        isActive: _selectedTab == 2,
                        onTap: () => setState(() => _selectedTab = 2),
                      ),
                    ],
                  ),
                ),
              ),
              // Task list
              Expanded(
                child: _buildTaskList(
                  tasks: _getTasksForTab(taskProvider),
                  context: context,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required int count,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return PremiumTabButton(
      label: label,
      count: count,
      isActive: isActive,
      onTap: onTap,
    );
  }

  List<Task> _getTasksForTab(TaskProvider taskProvider) {
    switch (_selectedTab) {
      case 0:
        return taskProvider.pendingTasks;
      case 1:
        return taskProvider.completedTasks;
      case 2:
        return taskProvider.deniedTasks;
      default:
        return [];
    }
  }

  Widget _buildTaskList({
    required List<Task> tasks,
    required BuildContext context,
  }) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done_all,
              size: 64,
              color: colors.outline.withOpacity(0.3),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'No tasks yet',
              style: textTheme.titleLarge?.copyWith(
                color: colors.outline,
              ),
            ),
          ],
        ),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 220),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      child: ListView.builder(
        key: ValueKey(_selectedTab),
        padding: const EdgeInsets.only(bottom: AppSpacing.lg),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return TaskCard(
            task: task,
            onTap: () {
              context.pushWithFadeSlide<void>(
                TaskDetailScreen(task: task),
              );
            },
          );
        },
      ),
    );
  }
}
