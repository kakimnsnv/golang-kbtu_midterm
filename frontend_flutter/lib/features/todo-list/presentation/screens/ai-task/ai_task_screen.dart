import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:to_do_go/core/theme/decorations.dart';
import 'package:to_do_go/features/todo-list/controllers/ai_task_screen_controller.dart';
import 'package:to_do_go/generated/l10n.dart';

class AddTaskAIScreen extends StatelessWidget {
  AddTaskAIScreen({super.key});

  final AiTaskScreenController controller = Get.put(AiTaskScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
              appBar: AppBar(
                title: Text(S.of(context).addTaskByAI),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).hello,
                      style: Get.textTheme.bodyLarge?.copyWith(color: Colors.black),
                    ),
                    Text(
                      S.of(context).aiTaskAddQuestion,
                      style: Get.textTheme.titleLarge?.copyWith(color: Colors.black),
                    ),
                    if (controller.text.value.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(top: 16).r,
                        padding: containerPadding,
                        decoration: containerDecoration,
                        child: Text(
                          controller.text.value,
                          style: Get.textTheme.bodyMedium?.copyWith(color: Colors.black),
                        ),
                      ),
                    const Spacer(),
                    if (controller.isListening.value)
                      Center(
                        child: AvatarGlow(
                          animate: controller.isListening.value,
                          glowColor: Get.theme.colorScheme.primary,
                          child: CircleAvatar(
                            backgroundColor: Get.theme.colorScheme.primary,
                            maxRadius: 50.r,
                            minRadius: 50.r,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.listen();
                              },
                              child: Icon(
                                Icons.mic,
                                size: 42.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (!controller.isListening.value)
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        controller.sendToBack();
                                      },
                                      child: Text(S.of(context).next))),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Expanded(
                                  child: FilledButton(
                                      onPressed: () {
                                        controller.restart();
                                      },
                                      child: Text(S.of(context).recordAgain))),
                            ],
                          ),
                          SizedBox(height: 32.h),
                        ],
                      ),
                    if (controller.isListening.value) const Spacer(),
                    if (controller.isListening.value)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20).r,
                        child: Center(
                            child: Text(
                          S.of(context).pressButtonAndSpeak,
                          style: Get.textTheme.bodySmall?.copyWith(color: Colors.grey),
                        )),
                      ),
                  ],
                ),
              )),
          if (controller.isSending.value)
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
