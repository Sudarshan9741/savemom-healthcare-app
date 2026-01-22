import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../mock_data/mock_tasks.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = List.from(MockTaskData.tasks);
  bool _isLoading = false;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  List<Task> get pendingTasks => _tasks.where((t) => t.status == TaskStatus.pending).toList();
  List<Task> get completedTasks => _tasks.where((t) => t.status == TaskStatus.completed).toList();
  List<Task> get deniedTasks => _tasks.where((t) => t.status == TaskStatus.denied).toList();

  Task? getTaskById(String id) {
    try {
      return _tasks.firstWhere((task) => task.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> markTaskCompleted(
    String taskId, {
    required String url,
    required String notes,
  }) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      final index = _tasks.indexWhere((t) => t.id == taskId);
      if (index != -1) {
        _tasks[index] = _tasks[index].copyWith(
          status: TaskStatus.completed,
          completionUrl: url,
          completionNotes: notes,
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> markTaskDenied(String taskId, String reason) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));

    try {
      final index = _tasks.indexWhere((t) => t.id == taskId);
      if (index != -1) {
        _tasks[index] = _tasks[index].copyWith(
          status: TaskStatus.denied,
          denyReason: reason,
        );
        notifyListeners();
      }
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void resetTask(String taskId) {
    final index = _tasks.indexWhere((t) => t.id == taskId);
    if (index != -1) {
      _tasks[index] = _tasks[index].copyWith(
        status: TaskStatus.pending,
        completionUrl: null,
        completionNotes: null,
        denyReason: null,
      );
      notifyListeners();
    }
  }
}
