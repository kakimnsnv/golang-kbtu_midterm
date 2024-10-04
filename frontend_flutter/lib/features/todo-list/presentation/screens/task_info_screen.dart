import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_go/core/theme/decorations.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/core/widgets/tdg_text.dart';
import 'package:to_do_go/core/widgets/tdg_textfield.dart';
import 'package:to_do_go/features/todo-list/controllers/task_info_controller.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/generated/l10n.dart';

class TaskInfoScreen extends StatelessWidget {
  TaskInfoScreen({super.key});

  final TaskInfoController controller = Get.put(TaskInfoController(Get.parameters, Get.arguments));

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GetBuilder<TaskInfoController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).addTask),
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16).r,
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TDGText(S.of(context).name),
                  TDGTextField(controller.nameController, S.of(context).enterName, validator: controller.nameValidator),
                  SizedBox(height: 12.h),
                  TDGText(S.of(context).date),
                  enterDate(context),
                  SizedBox(height: 12.h),
                  enterTime(context),
                  SizedBox(height: 12.h),
                  TDGText(S.of(context).prioritet),
                  Row(
                    children: [
                      Expanded(child: PrioritetButton(context, Priority.LOW)),
                      SizedBox(width: 8.w),
                      Expanded(child: PrioritetButton(context, Priority.MEDIUM)),
                      SizedBox(width: 8.w),
                      Expanded(child: PrioritetButton(context, Priority.HIGH)),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                          () => ElevatedButton(
                            onPressed: controller.isButtonNull.value
                                ? null
                                : () {
                                    if (formKey.currentState != null && formKey.currentState!.validate()) {
                                      controller.onPressed();
                                    }
                                  },
                            child: Text(S.of(context).save),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Row enterTime(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: timePickerWidget(context),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: timePickerWidget(context, isStart: false),
        ),
      ],
    );
  }

  Column timePickerWidget(BuildContext context, {bool isStart = true}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TDGText(isStart ? S.of(context).start : S.of(context).end),
        GestureDetector(
          onTap: () => Get.bottomSheet(
            timeBottomSheet(context, isStart),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).r,
              color: Get.theme.colorScheme.surface,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).getTime((isStart ? controller.startTime : controller.endTime) ?? DateTime(2024)),
                    style: Get.textTheme.bodyLarge?.copyWith(color: (isStart ? controller.startTime : controller.endTime) == null ? onSurfacText : Colors.black)),
                const Icon(Icons.arrow_forward_ios_rounded),
              ],
            ),
          ),
        ),
      ],
    );
  }

  GestureDetector enterDate(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            // return Container(
            //   height: 600.h,
            //   color: Colors.black,
            // );
            return dateBottomSheet(context);
          },
        );
        // Get.  bottomSheet(dateBottomSheet(context));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16).r,
          color: Get.theme.colorScheme.surface,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              controller.date == null ? S.of(context).enterDate : S.of(context).getddMMyyyy(controller.date!),
              style: Get.textTheme.bodyLarge?.copyWith(color: controller.date == null ? onSurfacText : Colors.black),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: onSurfacText),
          ],
        ),
      ),
    );
  }

  GestureDetector PrioritetButton(BuildContext context, Priority priority) {
    Color color;
    Color borderColor;
    String text;
    switch (priority) {
      case Priority.LOW:
        color = lowPriorityColor;
        borderColor = lowPriorityBorderColor;
        text = S.of(context).low;
        break;
      case Priority.MEDIUM:
        color = midPriorityColor;
        borderColor = midPriorityBorderColor;
        text = S.of(context).mid;
        break;
      case Priority.HIGH:
        color = highPriorityColor;
        borderColor = highPriorityBorderColor;
        text = S.of(context).high;
        break;
    }
    return GestureDetector(
      onTap: () {
        controller.priority = priority;
        controller.update();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12).r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16).r,
          border: controller.priority == priority ? Border.all(color: borderColor, width: 2) : null,
        ),
        child: Text(
          text,
          style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black),
        ),
      ),
    );
  }

  IntrinsicHeight timeBottomSheet(BuildContext context, bool isStart) {
    DateTime newTime = (isStart ? controller.startTime : controller.endTime) ?? DateTime.now();
    return IntrinsicHeight(
      child: Container(
        decoration: bottomSheetDecoration,
        child: Column(
          children: [
            Padding(
              padding: bottomSheetPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isStart ? S.of(context).start : S.of(context).end,
                    style: bottomSheetTitleTextStyle,
                  ),
                  IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close_rounded))
                ],
              ),
            ),
            SizedBox(
              height: 170.h,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (value) {
                  newTime = value;
                },
                initialDateTime: newTime,
                use24hFormat: true,
              ),
            ),
            Container(
              margin: bottomSheetBottomButtonMargin,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  isStart ? controller.startTime = newTime : controller.endTime = newTime;
                  controller.update();
                  Get.back();
                },
                child: Text(S.of(context).save),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dateBottomSheet(BuildContext context) {
    DateTime? newDate = controller.date;
    return IntrinsicHeight(
      child: Container(
        decoration: bottomSheetDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: bottomSheetPadding,
              child: Row(
                children: [
                  Text(
                    S.of(context).enterDate,
                    style: bottomSheetTitleTextStyle,
                  ),
                  const Spacer(),
                  IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close))
                ],
              ),
            ),
            StatefulBuilder(builder: (context, setState) {
              return SizedBox(
                height: 333.h,
                child: TableCalendar(
                  focusedDay: controller.date ?? DateTime.now(),
                  firstDay: DateTime(2024),
                  lastDay: DateTime(2026),
                  availableCalendarFormats: {CalendarFormat.month: "month"},
                  calendarFormat: CalendarFormat.month,
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    titleTextStyle: calendarHeaderTitleStyle,
                  ),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: calendarDefaultTextStyle,
                    weekendTextStyle: calendarDefaultTextStyle,
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: calendarDOWWeekdayTextStyle,
                    weekdayStyle: calendarDOWWeekendTextStyle,
                  ),
                  daysOfWeekHeight: 24.h,
                  onDaySelected: (day, _) {
                    setState(() {
                      newDate = day;
                    });
                  },
                  currentDay: newDate ?? (controller.date ?? DateTime.now()),
                ),
              );
            }),
            Container(
              margin: bottomSheetBottomButtonMargin,
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  controller.date = newDate != null ? newDate : DateTime.now();
                  controller.update();
                  Get.back();
                },
                child: Text(S.of(context).save),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
