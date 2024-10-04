import 'package:to_do_go/features/todo-list/models/task_models.dart';

interface class TasksControllerMixin {
  Future<bool> addTask(Task task) async {
    print("this is TasksControllerMixin`s addTask method");
    return true;
  }

  Future<bool> removeTask(Task task) async {
    print("this is TasksControllerMixin`s removeTask method");
    return true;
  }

  Future<bool> updateTask(Task task) async {
    print("this is TasksControllerMixin`s updateTask method");
    return true;
  }

  Future<bool> getTasks() async {
    print("this is TasksControllerMixin`s getTasks method");
    return true;
  }

  Task getTaskById(String id) {
    print("this is TasksControllerMixin`s getTaskById method");
    throw UnimplementedError();
  }
}
