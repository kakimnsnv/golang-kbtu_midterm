import 'package:get/get.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get find => Get.find();

  DateTime day = DateTime.now();

  void addTask() {
    Get.toNamed("/add-task"); //TODO: goToAddTask screen
  }

  void goToTask(Task task) {
    Get.toNamed(""); //TODO: goToTask task screen
  }
}
