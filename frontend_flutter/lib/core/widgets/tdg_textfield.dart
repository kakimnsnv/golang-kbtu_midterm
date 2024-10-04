import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/core/theme/theme.dart';

TextFormField TDGTextField(TextEditingController controller, String hintText, {String? Function(String?)? validator, bool obscureText = false}) {
  return TextFormField(
    obscureText: obscureText,
    validator: validator,
    controller: controller,
    style: Get.textTheme.bodyLarge?.copyWith(color: Colors.black),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.bodyLarge?.copyWith(color: onSurfacText),
      focusColor: primary2.withOpacity(0.05),
    ),
  );
}
