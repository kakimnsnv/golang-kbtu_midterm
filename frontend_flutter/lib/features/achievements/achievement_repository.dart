import 'package:to_do_go/features/achievements/models/achievement_models.dart';

abstract class AchievementRepository {
  Future<List<Achievement>> fetchAchievements();

  Stream<List<Achievement>> watchAchievements();

  Future<void> addAchievement(Achievement achievement);

  Future<void> removeAchievement(Achievement achievement);

  Future<void> updateAchievement(Achievement achievement);
}

abstract class UserAchievementsRepository {
  Future<List<UserAchievement>> fetchUserAchievements();

  Stream<List<UserAchievement>> watchUserAchievements();

  Future<void> addUserAchievement(UserAchievement userAchievement);

  Future<void> removeUserAchievement(UserAchievement userAchievement);

  Future<void> updateUserAchievement(UserAchievement userAchievement);
}
