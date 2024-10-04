import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/features/todo-list/controllers/ai_tasks_list_screen_controller.dart';
import 'package:to_do_go/features/todo-list/presentation/widgets/task_tile.dart';
import 'package:to_do_go/generated/l10n.dart';

class AddTaskAIListScreen extends StatelessWidget {
  AddTaskAIListScreen({super.key});

  final AiTasksListScreenController controller = Get.put(AiTasksListScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).addTaskByAI),
        ),
        floatingActionButton: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: ElevatedButton(
                  onPressed: () {
                    controller.addAllTasks();
                  },
                  child: Text(S.of(context).addAllTasks),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).r,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).yourPlansFor(DateTime.now()),
                  style: Get.textTheme.labelMedium?.copyWith(color: Colors.black),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 20).r,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14).r,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(12).r,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.error_outline, color: Colors.red),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          S.of(context).checkAITasks,
                          maxLines: 2,
                          softWrap: true,
                          style: Get.textTheme.bodySmall?.copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        ...controller.tasks.map((t) {
                          return TaskTile(t, controller: controller, isAi: true);
                        }).toList(),
                        SizedBox(height: 70.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
