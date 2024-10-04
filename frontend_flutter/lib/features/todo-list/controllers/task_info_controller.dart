import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_go/core/user_session.dart';
import 'package:to_do_go/features/todo-list/controllers/ai_tasks_list_screen_controller.dart';
import 'package:to_do_go/features/todo-list/controllers/task_list_controller.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/generated/l10n.dart';

class TaskInfoController extends GetxController {
  static TaskInfoController get find => Get.find();

  final TaskListController tasksController = Get.find();
  final UserSession userSession = GetIt.I.get<UserSession>();

  TaskInfoController(this.params, this.args);
  final bool isAi = Get.parameters["isAi"] == "true";

  // MARK: VARS
  Map<String, String?> params;
  dynamic args;
  AiTasksListScreenController? aiTasksListScreenController;

  Task? task;

  TextEditingController nameController = TextEditingController();
  DateTime? date;
  DateTime? startTime;
  DateTime? endTime;
  Priority priority = Priority.LOW;

  RxBool showErrors = false.obs;
  RxBool isButtonNull = true.obs;

  String dateError = '';
  String startTimeError = '';
  String endTimeError = '';

  // MARK: OnInit
  @override
  void onInit() {
    super.onInit();
    task = null;
    if (args != null && args["task"] != null && args["task"] is Task) {
      if (args["controller"] != null && args["controller"] is AiTasksListScreenController && isAi) {
        aiTasksListScreenController = args["controller"];
      }
      task = args["task"];
      // if (args != null && args is Task) {
      // task = args;
      nameController.text = task!.name;
      date = task!.startTime;
      startTime = task!.startTime;
      endTime = task!.endTime;
      priority = task?.priority ?? Priority.LOW;
    }
  }

  // MARK: FUNCTIONS

  bool isNotValid() {
    dateError = '';
    startTimeError = '';
    endTimeError = '';
    isButtonNull.value = true;
    if (date == null) dateError = 'Date is required';
    if (startTime == null) startTimeError = 'Start time is required';
    if (endTime == null) endTimeError = 'End time is required';
    if (dateError == "" && startTimeError == "" && endTimeError == "") isButtonNull.value = false;
    return isButtonNull.value;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.enterName;
    }
    isNotValid();
    return null;
  }

  void onPressed() {
    if (isNotValid()) {
      showErrors.value = true;
    } else {
      showErrors.value = false;
      startTime = DateTime(date!.year, date!.month, date!.day, startTime!.hour, startTime!.minute);
      endTime = DateTime(date!.year, date!.month, date!.day, endTime!.hour, endTime!.minute);

      final t = Task(
        id: task?.id ?? "new",
        name: nameController.text,
        startTime: startTime!,
        endTime: endTime!,
        priority: priority,
        createdDate: task?.createdDate ?? DateTime.now(),
        updatedDate: task?.updatedDate ?? DateTime.now(),
        order: task?.order ?? 0,
        status: task?.status ?? Status.OPEN,
        userId: task?.userId ?? userSession.activeUser?.id ?? "0",
      );
      if (t.id == "new") {
        tasksController.addTask(t);
        Get.back();
      } else if (t.id.startsWith("ai")) {
        aiTasksListScreenController?.updateTask(t);
        Get.back();
      } else if (t.id.startsWith("db")) {
        tasksController.updateTask(t);
        Get.back();
      } else {
        tasksController.updateTask(t);
        Get.back();
      }
    }
  }
}
