class Achievement {
  final String id;
  final String name;
  final String description;
  final AchievementType type;
  final String backgroundColor; //? @kakimnsnv: added by me
  final int condition;

  Achievement({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.backgroundColor,
    required this.condition,
  });
}

enum AchievementType {
  LOGIN_STREAK_BRONZE, //    LOGIN_STREAK_BRONZE = 'loginStreakBronze',
  LOGIN_STREAK_SILVER, //    LOGIN_STREAK_SILVER = 'loginStreakSilver',
  LOGIN_STREAK_GOLD, //    LOGIN_STREAK_GOLD = 'loginStreakGold',
  TASK_COMPLETION_MASTER, //   TASK_COMPLETION_MASTER = 'taskCompletionMaster',
  TASK_COMPLETION_LEADER, //   TASK_COMPLETION_LEADER = 'taskCompletionLeader',
  TASK_CREATED_WITH_AI, //   TASK_CREATED_WITH_AI = 'taskCreatedWithAi',
}

class UserAchievement {
  final String id;
  final String userId;
  final String achievementId;
  final DateTime dateAwarded;

  UserAchievement({
    required this.id,
    required this.userId,
    required this.achievementId,
    required this.dateAwarded,
  });
}

List<Achievement> sampleAchivements = [
  Achievement(id: "1", name: "Брон", description: "7 дней подряд входа в приложение", type: AchievementType.LOGIN_STREAK_BRONZE, backgroundColor: "211211211", condition: 1),
  Achievement(id: "2", name: "Сер", description: "14 дней подряд входа в приложение", type: AchievementType.LOGIN_STREAK_SILVER, backgroundColor: "204221255", condition: 1),
  Achievement(id: "3", name: "зол", description: "21 дней подряд входа в приложение", type: AchievementType.LOGIN_STREAK_GOLD, backgroundColor: "235187167", condition: 1),
  Achievement(id: "4", name: "мастер задач", description: "Награда за 100 выполненных задач ", type: AchievementType.TASK_COMPLETION_MASTER, backgroundColor: "188225233", condition: 1),
  Achievement(id: "5", name: "лидер задач", description: "Награда за 500 выполненных задач ", type: AchievementType.TASK_COMPLETION_LEADER, backgroundColor: "238244255", condition: 1),
  Achievement(id: "6", name: "ИИ задачник", description: "Награда За 10 использований AI для создания задач", type: AchievementType.TASK_CREATED_WITH_AI, backgroundColor: "248233226", condition: 1),
];

List<String> backgroundColors = [
  "211211211",
  "204221255",
  "235187167",
  "188225233",
  "238244255",
  "248233226",
];
