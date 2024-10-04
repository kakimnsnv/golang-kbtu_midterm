import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/core/assets.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/features/todo-list/controllers/tasks_controller_interface.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/generated/l10n.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {super.key, required this.controller, this.isAi = false});

  final bool isAi;
  final Task task;

  final TasksControllerMixin controller;

  @override
  Widget build(BuildContext context) {
    Color containerColor;
    switch (task.priority ?? Priority.LOW) {
      case Priority.LOW:
        containerColor = lowPriorityColor;
      case Priority.MEDIUM:
        containerColor = midPriorityColor;
      case Priority.HIGH:
        containerColor = highPriorityColor;
    }
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.toNamed("/task", arguments: {"task": task, "controller": controller}, parameters: {"isAi": isAi.toString()}),
      child: Container(
        padding: const EdgeInsets.all(12).r,
        margin: const EdgeInsets.only(bottom: 16).r,
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(16).r,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (!isAi)
              GestureDetector(
                onTap: () => controller.updateTask(task.copyWith(status: task.status == Status.COMPLETED ? Status.OPEN : Status.COMPLETED)),
                child: Icon(task.status == Status.OPEN ? Icons.circle_outlined : Icons.check_circle_rounded, size: 24.r),
              ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.name,
                    style: Get.textTheme.titleSmall?.copyWith(
                        color: Colors.black.withOpacity(task.status.toInt == 2 ? 0.5 : 1),
                        decoration: task.status.toInt == 2 ? TextDecoration.lineThrough : TextDecoration.none,
                        decorationThickness: 1.sp,
                        decorationColor: Colors.black.withOpacity(0.5)),
                  ),
                  Text(
                    task.notes ?? S.of(context).thereMightBeADescription,
                    style: Get.textTheme.bodySmall?.copyWith(color: Colors.black.withOpacity(0.5)),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text("${S.of(context).getTime(task.startTime ?? DateTime(0))} - ${S.of(context).getTime(task.endTime ?? DateTime(0))}", style: Get.textTheme.bodySmall?.copyWith(color: Colors.black.withOpacity(0.5))),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/task/${task.id}", arguments: {"task": task, "controller": controller}, parameters: {"isAi": isAi.toString()});
                        },
                        child: SvgPicture.asset(TDGIcon.pencile, height: 15.h, width: 15.w),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: () {
                          showDeleteDialog(context);
                        },
                        child: SvgPicture.asset(TDGIcon.trashbin, height: 20.h, width: 20.w),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDeleteDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 24).r,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16).r,
                color: Get.theme.dialogBackgroundColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Get.theme.colorScheme.primaryContainer,
                    maxRadius: 28.r,
                    child: Icon(
                      Icons.question_mark_rounded,
                      size: 32.r,
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(S.of(context).remove, style: Get.textTheme.titleMedium?.copyWith(color: Colors.black)),
                  SizedBox(height: 8.h),
                  Text(S.of(context).areYouSureYouWantToDelete, style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black)),
                  SizedBox(height: 24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              controller.removeTask(task);
                              Get.back();
                            },
                            child: Text(S.of(context).yes)),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                          child: OutlinedButton(
                        onPressed: () => Get.back(),
                        child: Text(S.of(context).no),
                        style: Get.theme.outlinedButtonTheme.style?.copyWith(
                          backgroundColor: WidgetStatePropertyAll(Get.theme.colorScheme.surface),
                          side: WidgetStatePropertyAll(BorderSide(width: 0, color: Get.theme.colorScheme.surface)),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
