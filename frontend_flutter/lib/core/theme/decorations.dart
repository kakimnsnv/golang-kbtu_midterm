import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

// Bottom Sheet
BoxDecoration bottomSheetDecoration = BoxDecoration(
  color: Get.theme.colorScheme.background,
  borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)).r,
);

BoxDecoration containerDecoration = BoxDecoration(
  color: Get.theme.colorScheme.surface,
  borderRadius: BorderRadius.circular(16).r,
);

EdgeInsets containerPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 14).r;

EdgeInsets bottomSheetPadding = const EdgeInsets.only(left: 10, right: 10, top: 20).r;
EdgeInsets bottomSheetBottomButtonMargin = const EdgeInsets.only(left: 16, right: 16, bottom: 44, top: 10).r;

TextStyle? bottomSheetTitleTextStyle = Get.textTheme.titleMedium?.copyWith(color: Colors.black);

// Table Calendar

TextStyle calendarHeaderTitleStyle = Get.textTheme.bodyLarge?.copyWith(color: Colors.black) ?? TextStyle();

TextStyle calendarDefaultTextStyle = Get.textTheme.bodyLarge?.copyWith(color: Get.theme.colorScheme.onSurface) ?? TextStyle();

TextStyle calendarDOWWeekdayTextStyle = Get.textTheme.titleMedium?.copyWith(color: Colors.black) ?? TextStyle();
TextStyle calendarDOWWeekendTextStyle = calendarDOWWeekdayTextStyle;
