import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_go/core/user_session.dart';

class OnBoardingScreenController extends GetxController {
  static OnBoardingScreenController get find => Get.find();

  final UserSession userSession = GetIt.I.get<UserSession>();

  RxInt currentPage = 0.obs;
  PageController pageController = PageController(initialPage: 0);

  void nextPage() {
    if (currentPage.value == 2) {
      skip();
      return;
    }
    currentPage.value++;
    pageController.animateToPage(currentPage.value, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void skip() {
    userSession.setFirstTime(false);
    Get.offAllNamed("/auth");
  }
}
