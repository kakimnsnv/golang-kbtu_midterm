import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_go/core/assets.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/features/auth-profile/screens/profile_screen.dart';
import 'package:to_do_go/features/todo-list/controllers/task_list_controller.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';
import 'package:to_do_go/features/todo-list/presentation/screens/home/home_screen_controller.dart';
import 'package:to_do_go/features/todo-list/presentation/widgets/task_tile.dart';
import 'package:to_do_go/generated/l10n.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeScreenController controller = Get.put(HomeScreenController());

  final TaskListController todoListController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (cc) {
      return GetBuilder<TaskListController>(builder: (c) {
        return Scaffold(
          floatingActionButton: floatingActionButton(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Calendar(),
                c.getTasksByDateWithNulls(cc.day).isEmpty ? emptyTasksListContainer(context) : Expanded(child: tasksList(context)),
              ],
            ),
          ),
        );
      });
    });
  }

  Column tasksList(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16).r,
          child: Row(
            children: [
              Text(S.of(context).time, style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black.withOpacity(0.4))),
              SizedBox(width: 16.w),
              Text(S.of(context).tasksList, style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black.withOpacity(0.4))),
              SizedBox(width: 16.w),
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(achievementBottomSheet(context));
                },
                child: Text("Получить ачивку", style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black.withOpacity(0.4))),
              ),
            ],
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: GetBuilder<TaskListController>(builder: (cc) {
                List<Task> tsks = cc.getTasksByDateWithNulls(controller.day);
                tsks.sort((a, b) => a.status.toInt.compareTo(b.status.toInt));
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    ...tsks.map((t) {
                      return TaskTile(t, controller: todoListController);
                    }).toList(),
                    SizedBox(height: 46.h),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Expanded emptyTasksListContainer(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 80).r,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16).r, color: primary2.withOpacity(0.1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              TDGIcon.noTasks,
              width: 150.w,
              height: 150.h,
            ),
            Text(S.of(context).tasksListEmpty, style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }

  Widget Calendar() {
    return TableCalendar(
      rowHeight: 64.h,
      focusedDay: controller.day,
      firstDay: controller.day.subtract(const Duration(days: 365)),
      lastDay: controller.day.add(const Duration(days: 365)),
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        titleCentered: true,
        titleTextFormatter: (date, _) {
          return "${S.current.getMonth(date).capitalize}, ${date.year}";
        },
        titleTextStyle: Get.textTheme.titleMedium?.copyWith(color: Colors.black) ?? const TextStyle(),
      ),
      availableCalendarFormats: const {
        CalendarFormat.week: 'Week',
      },
      daysOfWeekVisible: false,
      currentDay: controller.day,
      calendarBuilders: CalendarBuilders(
        todayBuilder: (context, day, _) {
          return calendarTodayBuilderWidget(day, context);
        },
        disabledBuilder: (context, day, _) {
          return calendarDayBuilderWidget(day, context);
        },
        defaultBuilder: (context, day, _) {
          return calendarDayBuilderWidget(day, context);
        },
        outsideBuilder: (context, day, _) {
          return calendarDayBuilderWidget(day, context);
        },
      ),
    );
  }

  Container calendarTodayBuilderWidget(DateTime day, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(100).r,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            maxRadius: 15.r,
            child: Text(day.day.toString(), style: Get.textTheme.bodySmall?.copyWith(color: Colors.black)),
          ),
          Text(
            S.of(context).getDOW(day).toUpperCase(),
            style: Get.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget calendarDayBuilderWidget(DateTime day, BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.day = day;
        controller.update();
      },
      child: Container(
        padding: const EdgeInsets.all(8).r,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              maxRadius: 15.r,
              child: Text(day.day.toString(), style: Get.textTheme.bodySmall?.copyWith(color: Colors.black)),
            ),
            Text(
              S.of(context).getDOW(day).toUpperCase(),
              style: Get.textTheme.bodySmall?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Row floatingActionButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ZoomTapAnimation(
          child: ElevatedButton(
            onPressed: () => Get.toNamed("/add-task"),
            //TODO: change to SvgPicture.asset("assets/icons/plus.svg") add plus to assets.dart,
            child: const Icon(Icons.add),
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(horizontal: 45, vertical: 12).r),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(46).r)),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        ZoomTapAnimation(
          child: ElevatedButton(
            onPressed: () => Get.toNamed("/add-task-ai"),
            //TODO: change to SvgPicture.asset("assets/icons/mic.svg") add mic to assets.dart,
            child: const Icon(Icons.mic),
            style: ButtonStyle(
              padding: WidgetStatePropertyAll(const EdgeInsets.symmetric(horizontal: 45, vertical: 12).r),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(46).r)),
            ),
          ),
        ),
      ],
    );
  }
}

Widget achievementBottomSheet(BuildContext context) {
  return IntrinsicHeight(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)).r,
        color: Get.theme.colorScheme.surface,
      ),
      padding: const EdgeInsets.all(16).r,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "У вас новое достижение 🔥",
                style: Get.textTheme.titleMedium?.copyWith(color: Colors.black),
              ),
              IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close)),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).r,
              color: Get.theme.colorScheme.background,
            ),
            child: Column(
              children: [
                Image.asset(TDGAsset.achievement1, width: 80.w, height: 80.h),
                SizedBox(height: 16.h),
                Text("Бронзовая медаль", style: Get.textTheme.titleMedium?.copyWith(color: Colors.black)),
                SizedBox(height: 8.h),
                Text("За посещение приложения 7 дней подряд", style: Get.textTheme.bodySmall?.copyWith(color: Colors.black)),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.back(),
                  child: Text("Показать", style: Get.textTheme.bodyMedium),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
