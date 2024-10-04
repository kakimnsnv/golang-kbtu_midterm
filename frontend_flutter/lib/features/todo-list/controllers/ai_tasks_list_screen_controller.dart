import 'dart:developer';

import 'package:get/get.dart';
import 'package:to_do_go/features/todo-list/controllers/task_list_controller.dart';
import 'package:to_do_go/features/todo-list/controllers/tasks_controller_interface.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/generated/l10n.dart';

class AiTasksListScreenController extends GetxController implements TasksControllerMixin {
  static AiTasksListScreenController get find => Get.find();

  final TaskListController tasksListController = Get.find();

  RxList<Task> tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is List<Task>) {
      tasks.value.addAll(Get.arguments);
    } else {
      Get.snackbar(S.current.error, "Error passing tasks from previous screen");
    }
  }

  Future<bool> addAllTasks() async {
    for (Task t in tasks.value) {
      await tasksListController.addTask(t);
    }
    Get.back();
    return true;
  }

  @override
  Future<bool> addTask(Task task) async {
    return await tasksListController.addTask(task);
  }

  @override
  Future<bool> removeTask(Task task) async {
    tasks.remove(task);
    return true;
  }

  @override
  Future<bool> updateTask(Task task) async {
    tasks[tasks.indexWhere((t) => t.id == task.id)] = task;
    return true;
  }

  @override
  Task getTaskById(String id) {
    // TODO: implement getTaskById
    throw UnimplementedError();
  }

  @override
  Future<bool> getTasks() {
    throw UnimplementedError();
  }
}
