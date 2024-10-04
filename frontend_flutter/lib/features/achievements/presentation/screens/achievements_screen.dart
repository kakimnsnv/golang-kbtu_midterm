import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_go/core/assets.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/features/achievements/achievements_controller.dart';
import 'package:to_do_go/features/achievements/models/achievement_models.dart';
import 'package:to_do_go/generated/l10n.dart';

class AchievementsScreen extends GetView<AchievementsController> {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(S.of(context).achievement),
        backgroundColor: Get.theme.colorScheme.background,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16).r,
            color: Get.theme.colorScheme.background,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 14).r,
          padding: const EdgeInsets.all(12).r,
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 155 / 128,
              ),
              itemCount: controller.achievements.length,
              itemBuilder: (context, index) {
                // TODO: redo
                final r = int.parse(controller.achievements[index].backgroundColor.substring(0, 3));
                final g = int.parse(controller.achievements[index].backgroundColor.substring(3, 6));
                final b = int.parse(controller.achievements[index].backgroundColor.substring(6, 9));
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showAchievement(context, controller.achievements[index], index);
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12).r,
                            child: ColorFiltered(
                              colorFilter: !controller.isAchieved(controller.achievements[index]) ? ColorFilter.mode(achievementBlockedColor, BlendMode.saturation) : ColorFilter.mode(Colors.transparent, BlendMode.multiply),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12).r,
                                  color: !controller.isAchieved(controller.achievements[index]) ? Colors.yellow : Color.fromRGBO(r, g, b, 1),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 37, vertical: 11).r,
                                child: Image.asset(
                                  TDGAsset.achievements[index],
                                ),
                              ),
                            ),
                          ),
                          if (!controller.isAchieved(controller.achievements[index]))
                            Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[600],
                                child: Icon(Icons.lock_rounded, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      controller.achievements[index].name,
                      style: Get.textTheme.bodySmall?.copyWith(color: Colors.black),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  Future<dynamic> showAchievement(BuildContext context, Achievement achievement, int index) {
    return showDialog(
      context: context,
      useSafeArea: false,
      builder: (context) {
        return GestureDetector(
          onTap: () => Get.back(),
          child: Stack(
            children: [
              if (true)
                Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ),
                ),
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.multiply),
                      // colorFilter:  ColorFilter.mode(achievementBlockedColor.withOpacity(0.1), BlendMode.saturation),
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.01),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 165).r,
                            child: Image.asset(
                              TDGAsset.achievements[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, top: 68).r,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(Icons.close_rounded, color: Colors.white),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 76).r,
                        child: Text(achievement.name, style: Get.textTheme.titleLarge),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 140).r,
                        child: Text(achievement.description, style: Get.textTheme.bodyLarge),
                      ),
                    ),
                    if (controller.isAchieved(achievement))
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, right: 16, bottom: 68).r,
                          child: OutlinedButton(
                            onPressed: () {}, // TODO: implement share
                            style: Get.theme.outlinedButtonTheme.style?.copyWith(foregroundColor: WidgetStatePropertyAll(Colors.black)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.share_rounded),
                                SizedBox(width: 8.w),
                                Text(S.of(context).share),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
