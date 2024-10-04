import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_go/features/api/models/api_client.dart';
import 'package:to_do_go/generated/l10n.dart';

class LoginScreenController extends GetxController {
  static LoginScreenController get find => Get.find();

  final ApiClient apiClient = GetIt.I.get<ApiClient>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isValid = false.obs; //TODO: change to false
  RxBool isButtonNull = true.obs;

  String? emailValidator(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    validate();
    return value!.isNotEmpty && !regex.hasMatch(value) ? S.current.enterEmail : null;
  }

  String? passwordValidator(String? value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    final regex = RegExp(pattern);

    validate();
    return regex.hasMatch(value ?? "") ? null : S.current.enterPassword;
  }

  void validate() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isValid.value = true;
      isButtonNull.value = false;
    } else {
      isValid.value = false;
      isButtonNull.value = true;
    }
  }

  void login() async {
    if (isValid.value) {
      bool successful = await apiClient.login(email: emailController.text, password: passwordController.text);
      if (successful) {
        Get.offAllNamed("/");
      } else {
        // Get.snackbar(S.current.error, S.current.loginError);
      }
    }
  }
}
