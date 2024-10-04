import 'dart:developer';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:to_do_go/features/todo-list/controllers/tasks_controller_interface.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/features/todo-list/task_repository.dart';

class TaskListController extends GetxController implements TasksControllerMixin {
  static TaskListController get find => Get.find();
  final TaskRepositoryImpl taskRepository = Get.find();

  RxList<Task> tasks = <Task>[].obs;

  @override
  void onInit() async {
    await getTasks();
    super.onInit();
  }

  @override
  Future<bool> addTask(Task task) async {
    final isSuccessful = await taskRepository.addTask(task);
    getTasks();
    return isSuccessful;
  }

  @override
  Future<bool> getTasks() async {
    tasks.value = await taskRepository.fetchTasks();
    update();
    return true;
  }

  Future<bool> getTasksWithoutUpdate() async {
    tasks.value = await taskRepository.fetchTasks();
    return true;
  }

  @override
  Future<bool> removeTask(Task task) async {
    final isSuccessful = await taskRepository.removeTask(task);
    getTasks();
    return isSuccessful;
  }

  @override
  Future<bool> updateTask(Task task) async {
    final isSuccessful = await taskRepository.updateTask(task);
    getTasks();
    return isSuccessful;
  }

  @override
  Task getTaskById(String id) {
    return tasks[tasks.indexWhere((element) => element.id == id)];
  }

  List<Task> getTasksByDate(DateTime date) {
    return tasks.where((t) => t.startTime?.day == date.day && t.startTime?.month == date.month && t.startTime?.year == date.year).toList();
  }

  List<Task> getTasksByDateWithNulls(DateTime date) {
    getTasksWithoutUpdate();
    return tasks.where((t) => t.startTime?.day == date.day && t.startTime?.month == date.month && t.startTime?.year == date.year || t.startTime == null).toList();
  }
}
