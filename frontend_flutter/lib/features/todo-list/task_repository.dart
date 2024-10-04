import 'package:to_do_go/features/api/models/api_client.dart';
import 'package:to_do_go/features/local-storage/drift/drift_db.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();

  Stream<List<Task>> watchTasks();

  Future<bool> addTask(Task task);

  Future<bool> removeTask(Task task);

  Future<bool> updateTask(Task task);
}

class TaskRepositoryImpl implements TaskRepository {
  final LocalDatabase localDB;
  final ApiClient apiClient;

  Map<ChangeType, Task> changes = {};
  TaskRepositoryImpl({required this.localDB, required this.apiClient});

  Future applyChanges() async {
    if (changes.isEmpty) return;
    changes.forEach(
      (key, value) async {
        bool? isSuccessful;
        switch (key) {
          case ChangeType.ADD:
            isSuccessful = await apiClient.addTask(value);
            break;
          case ChangeType.REMOVE:
            isSuccessful = await apiClient.removeTask(value);
            break;
          case ChangeType.UPDATE:
            isSuccessful = await apiClient.updateTask(value);
            break;
        }
        if (isSuccessful != null && isSuccessful) {
          changes.remove(key);
        }
      },
    );
  }
  //change

  @override
  Future<bool> addTask(Task task) async {
    await applyChanges();
    final bool isSuccessful = await apiClient.addTask(task);

    if (isSuccessful) {
      return true;
    } else {
      Task t = task.copyWith(id: "db");
      bool dbIsSuccessful = await localDB.taskDAO.addTask(t);
      if (dbIsSuccessful) {
        changes[ChangeType.ADD] = t;
      }
      return dbIsSuccessful;
    }
  }

  @override
  Future<List<Task>> fetchTasks() async {
    await applyChanges();
    final List<Task>? apiTasks = await apiClient.fetchTasks();
    if (apiTasks != null && apiTasks.isNotEmpty) {
      await localDB.taskDAO.deleteAllTasks();
      await localDB.taskDAO.insertTasks(apiTasks);
      return apiTasks;
    } else {
      final List<Task> dbTasks = await localDB.taskDAO.fetchTasks();
      return dbTasks;
    }
  }

  @override
  Future<bool> removeTask(Task task) async {
    await applyChanges();
    final isSuccessful = await apiClient.removeTask(task);
    if (isSuccessful) {
      return true;
    } else {
      final dbIsSuccessful = await localDB.taskDAO.removeTask(task);
      if (dbIsSuccessful) {
        changes[ChangeType.REMOVE] = task;
      }
      return dbIsSuccessful;
    }
  }

  @override
  Future<bool> updateTask(Task task) async {
    await applyChanges();
    final isSuccessful = await apiClient.updateTask(task);
    if (isSuccessful) {
      return true;
    } else {
      final dbIsSuccessful = await localDB.taskDAO.updateTask(task);
      if (dbIsSuccessful) {
        changes[ChangeType.UPDATE] = task;
      }
      return dbIsSuccessful;
    }
  }

  @override
  Stream<List<Task>> watchTasks() {
    return apiClient.watchTasks();
  }
}

enum ChangeType {
  ADD,
  REMOVE,
  UPDATE,
}
