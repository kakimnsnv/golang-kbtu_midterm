import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_go/core/assets.dart';
import 'package:to_do_go/core/routing/bottom_navigation_bar_controller.dart';
import 'package:to_do_go/core/theme/theme.dart';
import 'package:to_do_go/core/user_session.dart';
import 'package:to_do_go/features/auth-profile/controllers/profile_screen_controller.dart';
import 'package:to_do_go/features/auth-profile/models/user_models.dart';
import 'package:to_do_go/generated/l10n.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileScreenController controller = Get.put(ProfileScreenController());
  final BottomNavigationBarController bottomController = Get.put(BottomNavigationBarController());

  final UserSession userSession = GetIt.I.get<UserSession>();

  @override
  Widget build(BuildContext context) {
    User? user = userSession.activeUser;
    return Obx(
      () => Scaffold(
        backgroundColor: Get.theme.colorScheme.surface,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(S.of(context).settings),
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16).r,
                  color: Get.theme.colorScheme.background,
                ),
                margin: const EdgeInsets.only(top: 7, left: 16, right: 16, bottom: 20).r,
                padding: const EdgeInsets.all(20).r,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const CircleAvatar(foregroundImage: NetworkImage("https://picsum.photos/200")),
                    SizedBox(height: 12.h),
                    Text(
                      "${user?.username}",
                      style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16).r,
                  color: Get.theme.colorScheme.background,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                margin: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14).r,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(TDGIcon.notification),
                          SizedBox(width: 10.w),
                          Text(
                            S.of(context).notifications,
                            style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 24.h,
                            width: 46.w,
                            child: Switch.adaptive(
                              value: true,
                              onChanged: (_) {},
                              applyCupertinoTheme: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.bottomSheet(
                        userAgreementBottomSheet(context),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14).r,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(TDGIcon.lock),
                            SizedBox(width: 10.w),
                            Text(
                              S.of(context).userAgreement,
                              style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            const Icon(Icons.arrow_forward_ios_rounded),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.bottomSheet(
                        IntrinsicHeight(
                          child: Container(
                            padding: const EdgeInsets.all(16).r,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)).r,
                              color: Get.theme.colorScheme.surface,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      S.of(context).language,
                                      style: Get.textTheme.titleMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                                    ),
                                    IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close)),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    S.load(const Locale("kk"));
                                    controller.locale.value = "kk";
                                    controller.update();
                                    bottomController.update();
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12).r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16).r,
                                      color: Get.theme.colorScheme.background,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          S.of(context).kazakh,
                                          style: Get.textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          controller.locale.value == "kk" ? Icons.check_circle : Icons.circle_outlined,
                                          color: primary,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                GestureDetector(
                                  onTap: () {
                                    S.load(const Locale("ru"));
                                    controller.locale.value = "ru";
                                    controller.update();
                                    bottomController.update();
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 12).r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16).r,
                                      color: Get.theme.colorScheme.background,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          S.of(context).russian,
                                          style: Get.textTheme.titleSmall?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
                                        ),
                                        const Spacer(),
                                        Icon(
                                          controller.locale.value == "ru" ? Icons.check_circle : Icons.circle_outlined,
                                          color: primary,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14).r,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(TDGIcon.globe),
                            SizedBox(width: 10.w),
                            Text(
                              S.of(context).language,
                              style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              controller.locale.value == "ru" ? S.of(context).rus : S.of(context).kaz,
                              style: Get.textTheme.bodyMedium?.copyWith(color: Get.theme.colorScheme.onSurface),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  userSession.clear();
                  Get.offAllNamed("/auth");
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16).r,
                    color: Get.theme.colorScheme.background,
                  ),
                  margin: const EdgeInsets.only(top: 7, left: 16, right: 16, bottom: 20).r,
                  padding: const EdgeInsets.all(15).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(TDGIcon.exit),
                      SizedBox(width: 10.w),
                      Text(
                        S.of(context).exitAccount,
                        style: Get.textTheme.bodyMedium?.copyWith(color: const Color(0xffE70E38), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

IntrinsicHeight userAgreementBottomSheet(BuildContext context) {
  return IntrinsicHeight(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)).r,
        color: Get.theme.colorScheme.surface,
      ),
      padding: const EdgeInsets.all(16).r,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(context).userAgreement,
                style: Get.textTheme.titleMedium?.copyWith(color: Colors.black),
              ),
              IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.close)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).r,
              color: Get.theme.colorScheme.background,
            ),
            child: Text(
              S.of(context).userAgreementText,
              style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16).r,
            child: Row(
              children: [
                Expanded(child: ElevatedButton(onPressed: () => Get.back(), child: Text(S.of(context).understand))),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
