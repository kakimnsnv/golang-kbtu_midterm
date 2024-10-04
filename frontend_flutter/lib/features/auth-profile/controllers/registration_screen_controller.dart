import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_go/features/api/models/api_client.dart';
import 'package:to_do_go/generated/l10n.dart';

class RegistrationScreenController extends GetxController {
  static RegistrationScreenController get find => Get.find();

  final ApiClient apiClient = GetIt.I.get<ApiClient>();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool isValid = false.obs; //TODO: change to false
  RxBool isButtonNull = true.obs;

  String? fullNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.enterFullName;
    }
    validate();
    return null;
  }

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

  String? phoneNumberValidator(String? value) {
    const pattern = r"(^8|7|\+7)((\d{10})|(\s\(\d{3}\)\s\d{3}\s\d{2}\s\d{2}))";
    final regex = RegExp(pattern);

    validate();
    return regex.hasMatch(value ?? "") ? null : S.current.enterPhoneNumber;
  }

  String? passwordValidator(String? value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$';
    final regex = RegExp(pattern);

    validate();
    return regex.hasMatch(value ?? "") ? null : S.current.enterPassword;
  }

  String? confirmPasswordValidator(String? value) {
    validate();
    return value == passwordController.text ? null : S.current.enterConfimationPassword;
  }

  // TODO: actually validate
  void validate() {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        (passwordController.text == confirmPasswordController.text)) {
      isValid.value = true;
      isButtonNull.value = false;
    } else {
      isValid.value = false;
      isButtonNull.value = true;
    }
  }

  //TODO: implement registration
  void register() async {
    if (isValid.value) {
      bool successful = await apiClient.register(email: emailController.text, password: passwordController.text, username: fullNameController.text);
      if (successful)
        Get.offAllNamed("/auth/login");
      else
        Get.snackbar(S.current.error, S.current.registrationError);
    }
  }
}
