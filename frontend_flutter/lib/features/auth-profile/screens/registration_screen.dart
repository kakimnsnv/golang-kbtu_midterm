import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/core/widgets/tdg_text.dart';
import 'package:to_do_go/core/widgets/tdg_textfield.dart';
import 'package:to_do_go/features/auth-profile/controllers/registration_screen_controller.dart';
import 'package:to_do_go/generated/l10n.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final RegistrationScreenController controller = Get.put(RegistrationScreenController());

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).r,
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.isButtonNull.value
                        ? null
                        : () {
                            if (formKey.currentState != null && formKey.currentState!.validate()) {
                              controller.register();
                            }
                          },
                    child: Text(S.of(context).register),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).r,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 116).r,
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUnfocus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16).r,
                    child: Text(
                      S.of(context).registration,
                      style: Get.theme.textTheme.headlineLarge?.copyWith(color: Colors.black),
                    ),
                  ),
                  TDGText(S.of(context).fullName),
                  TDGTextField(
                    controller.fullNameController,
                    S.of(context).enterFullName,
                    validator: controller.fullNameValidator,
                  ),
                  SizedBox(height: 16.h),
                  TDGText(S.of(context).phoneNumber),
                  TDGTextField(controller.phoneNumberController, S.of(context).enterPhoneNumber, validator: controller.phoneNumberValidator),
                  TDGText(S.of(context).email),
                  TDGTextField(controller.emailController, S.of(context).enterEmail, validator: controller.emailValidator),
                  TDGText(S.of(context).password),
                  TDGTextField(controller.passwordController, S.of(context).enterPassword, validator: controller.passwordValidator, obscureText: true),
                  TDGText(S.of(context).confirmPassword),
                  TDGTextField(controller.confirmPasswordController, S.of(context).enterConfimationPassword, validator: controller.confirmPasswordValidator, obscureText: true),
                ],
              ),
            ),
          ),
        ));
  }
}
