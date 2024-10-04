import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/core/theme/theme.dart';

Text TDGText(String text) => Text(text, style: Get.textTheme.titleSmall?.copyWith(color: onSurfacText, fontWeight: FontWeight.w400));
