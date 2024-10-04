import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:to_do_go/core/assets.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/features/auth-profile/screens/profile_screen.dart';
import 'package:to_do_go/generated/l10n.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: onBoardingAndAuthBackgroundDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16).r,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Flexible(
                child: CenterWidgets(context),
              ),
              Text(
                S.of(context).youCanSignInThrought,
                style: Get.theme.textTheme.labelSmall,
              ),
              SizedBox(height: 20.h),
              Buttons(context),
              AgreementText(context),
            ],
          ),
        ),
      ),
    );
  }

  Column CenterWidgets(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          TDGAsset.rocket,
          height: 259.h,
          width: 259.w,
          fit: BoxFit.contain,
        ),
        Text(
          S.of(context).toDoGo,
          style: Get.theme.textTheme.headlineMedium,
        ),
      ],
    );
  }

  Column Buttons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => Get.toNamed(""),
                // onPressed: null,
                style: Get.theme.filledButtonTheme.style?.copyWith(backgroundColor: WidgetStatePropertyAll(Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(TDGIcon.google),
                    SizedBox(width: 8.w),
                    Text(
                      S.of(context).google,
                      style: Get.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 9.w),
            Expanded(
              child: FilledButton(
                onPressed: () => Get.toNamed(""),
                // onPressed: null,
                style: Get.theme.filledButtonTheme.style?.copyWith(backgroundColor: WidgetStatePropertyAll(Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(TDGIcon.apple),
                    SizedBox(width: 8.w),
                    Text(
                      S.of(context).apple,
                      style: Get.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => Get.toNamed("/auth/login"),
                style: Get.theme.filledButtonTheme.style?.copyWith(backgroundColor: WidgetStatePropertyAll(Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(TDGIcon.mail),
                    SizedBox(width: 8.w),
                    Text(
                      S.of(context).signInWithEmail,
                      style: Get.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () => Get.toNamed("/auth/registration"),
                style: Get.theme.filledButtonTheme.style?.copyWith(backgroundColor: WidgetStatePropertyAll(Colors.white)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(TDGIcon.mail),
                    SizedBox(width: 8.w),
                    Text(
                      S.of(context).register,
                      style: Get.textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Padding AgreementText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 68, vertical: 35).r,
      child: GestureDetector(
        onTap: () {
          Get.bottomSheet(userAgreementBottomSheet(context));
        }, // TODO: agreement
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: Get.textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.6)),
            children: [
              TextSpan(text: S.of(context).proceedingYouAgree),
              TextSpan(text: S.of(context).proceedingYouAgree1, style: Get.textTheme.bodyMedium?.copyWith(color: Colors.white, decoration: TextDecoration.underline, decorationColor: Colors.white)),
              TextSpan(text: "To Do Go"),
            ],
          ),
        ),
      ),
    );
  }
}
