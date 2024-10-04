import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/core/routing/bottom_navigation_bar.dart';
import 'package:to_do_go/core/routing/bottom_navigation_bar_controller.dart';
import 'package:to_do_go/core/routing/get_router.dart';
import 'package:to_do_go/features/achievements/presentation/screens/achievements_screen.dart';
import 'package:to_do_go/features/auth-profile/screens/profile_screen.dart';
import 'package:to_do_go/features/todo-list/presentation/screens/home/home_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({this.page = MainScreens.HOME, super.key});
  final MainScreens page;

  final BottomNavigationBarController bottomNavigationBarController = Get.put(BottomNavigationBarController());

  @override
  StatelessElement createElement() {
    switch (page) {
      case MainScreens.HOME:
        bottomNavigationBarController.currentIndex.value = 0;
      case MainScreens.ACHIEVEMENTS:
        bottomNavigationBarController.currentIndex.value = 1;
      case MainScreens.PROFILE:
        bottomNavigationBarController.currentIndex.value = 2;
    }
    return super.createElement();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: TDGBottomNavigationBar(),
        body: Obx(
          () => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              HomeScreen(),
              AchievementsScreen(),
              ProfileScreen(),
            ],
          ),
        ),
      );
    });
  }
}
