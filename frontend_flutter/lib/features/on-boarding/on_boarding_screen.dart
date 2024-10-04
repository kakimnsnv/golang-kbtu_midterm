import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:to_do_go/core/assets.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/features/on-boarding/on_boarding_screen_controller.dart';
import 'package:to_do_go/generated/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final OnBoardingScreenController controller = Get.put(OnBoardingScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: onBoardingAndAuthBackgroundDecoration,
        child: SafeArea(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  child: TopWidgets(context),
                ),
                Flexible(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.antiAlias,
                    onPageChanged: (i) => controller.currentPage.value = i,
                    pageSnapping: true,
                    controller: controller.pageController,
                    children: [
                      CenterWidgets(context, S.of(context).onBoarding1, S.of(context).onBoarding1_1, TDGAsset.calendar, 168.h, 168.w, 52),
                      CenterWidgets(context, S.of(context).onBoarding2, S.of(context).onBoarding2_1, TDGAsset.clock, 222.h, 222.w, 20),
                      CenterWidgets(context, S.of(context).onBoarding3, S.of(context).onBoarding3_1, TDGAsset.rocket, 259.h, 259.w, 0),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20).r,
                  child: Row(
                    children: [
                      Expanded(child: OutlinedButton(onPressed: () => controller.nextPage(), child: Text(controller.currentPage.value == 2 ? S.of(context).start : S.of(context).next))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding CenterWidgets(BuildContext context, String text, String text1, String asset, double height, double width, double padding) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            asset,
            colorBlendMode: BlendMode.hardLight,
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
          SizedBox(height: padding.h),
          Text(text, textAlign: TextAlign.center, style: Get.textTheme.titleLarge),
          SizedBox(height: 16.h),
          Text(
            text1,
            textAlign: TextAlign.center,
            style: Get.textTheme.labelMedium?.copyWith(color: Colors.white.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Row TopWidgets(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: controller.pageController,
          count: 3,
          effect: ScrollingDotsEffect(
            activeDotColor: Get.theme.colorScheme.onPrimary,
            dotColor: Get.theme.colorScheme.onPrimary.withAlpha(153),
            dotHeight: 6.h,
            dotWidth: 6.w,
            activeDotScale: 8 / 6,
          ),
        ),
        TextButton(
            onPressed: () => controller.skip(),
            child: Text(
              S.of(context).skip,
              style: Get.theme.textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline, color: Get.theme.colorScheme.onPrimary, decorationColor: Get.theme.colorScheme.onPrimary),
            ))
      ],
    );
  }
}
