import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:to_do_go/core/assets.dart';
import 'package:to_do_go/core/routing/bottom_navigation_bar_controller.dart';
import 'package:to_do_go/generated/l10n.dart';

class TDGBottomNavigationBar extends StatelessWidget {
  TDGBottomNavigationBar({super.key});

  final BottomNavigationBarController bottomNavigationBarController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: bottomNavigationBarController.currentIndex.value,
        onTap: bottomNavigationBarController.changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (bottomNavigationBarController.currentIndex.value == 0)
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 3.r,
                  ),
                SizedBox(height: 4),
                SvgPicture.asset(
                  TDGIcon.home,
                  width: 18.w,
                  height: 18.h,
                  color: bottomNavigationBarController.currentIndex.value == 0 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            label: S.of(context).home,
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (bottomNavigationBarController.currentIndex.value == 1)
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 3.r,
                  ),
                SizedBox(height: 4),
                SvgPicture.asset(
                  TDGIcon.achievements,
                  width: 18.w,
                  height: 18.h,
                  color: bottomNavigationBarController.currentIndex.value == 1 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            label: S.of(context).achievement,
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (bottomNavigationBarController.currentIndex.value == 2)
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    maxRadius: 3.r,
                  ),
                SizedBox(height: 4),
                SvgPicture.asset(
                  TDGIcon.profile,
                  width: 18.w,
                  height: 18.h,
                  color: bottomNavigationBarController.currentIndex.value == 2 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            label: S.of(context).profile,
          ),
        ],
      ),
    );
  }
}
