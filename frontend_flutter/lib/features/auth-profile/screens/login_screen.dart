import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/core/widgets/tdg_text.dart';
import 'package:to_do_go/core/widgets/tdg_textfield.dart';
import 'package:to_do_go/features/auth-profile/controllers/login_screen_controller.dart';
import 'package:to_do_go/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginScreenController controller = Get.put(LoginScreenController());

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
                              controller.login();
                            }
                          },
                    child: Text(S.of(context).signInWithEmail),
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
                      S.of(context).signInWithEmail,
                      style: Get.theme.textTheme.headlineLarge?.copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  TDGText(S.of(context).email),
                  TDGTextField(controller.emailController, S.of(context).enterEmail, validator: controller.emailValidator),
                  TDGText(S.of(context).password),
                  TDGTextField(controller.passwordController, S.of(context).enterPassword, validator: controller.passwordValidator, obscureText: true),
                ],
              ),
            ),
          ),
        ));
  }
}
