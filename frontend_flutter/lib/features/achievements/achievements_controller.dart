import 'package:get/get.dart';
import 'package:to_do_go/features/achievements/models/achievement_models.dart';

class AchievementsController extends GetxController {
  static AchievementsController get find => Get.find();

  RxList<Achievement> achievements = <Achievement>[...sampleAchivements].obs;
  RxList<UserAchievement> userAchievements = <UserAchievement>[
    UserAchievement(achievementId: "1", dateAwarded: DateTime.now(), id: "1", userId: "1"),
    UserAchievement(achievementId: "2", dateAwarded: DateTime.now(), id: "2", userId: "1"),
    UserAchievement(achievementId: "3", dateAwarded: DateTime.now(), id: "3", userId: "1"),
  ].obs;

  void addAchievement(Achievement achievement) {
    achievements.add(achievement);
    update();
  }

  void removeAchievement(Achievement achievement) {
    achievements.remove(achievement);
    update();
  }

  void achieveAchivement(Achievement achievement) {
    userAchievements.add(UserAchievement(achievementId: achievement.id, dateAwarded: DateTime.now(), id: "", userId: "1"));
    update();
  }

  bool isAchieved(Achievement achievement) {
    return userAchievements.any((element) => element.achievementId == achievement.id);
  }

  void shareAchievement(Achievement achievement) {
    //TODO: do it
  }
}
