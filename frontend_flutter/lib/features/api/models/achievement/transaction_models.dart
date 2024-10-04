import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_go/features/achievements/models/achievement_models.dart';

part 'transaction_models.g.dart';

//? MARK: Achievement
@JsonSerializable()
class GetAchievementResponseModel {
  final String id;
  final String name;
  final String description;
  final String type;
  // final String backgroundColor; //? @kakimnsnv: added by me
  // final bool isAchieved; //? @kakimnsnv: added by me
  final int condition;

  GetAchievementResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    // required this.backgroundColor,
    // required this.isAchieved,
    required this.condition,
  });

  factory GetAchievementResponseModel.fromJson(Map<String, dynamic> json) => _$GetAchievementResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAchievementResponseModelToJson(this);

  Achievement toAchievement() {
    AchievementType ttype;
    switch (type) {
      case "loginStreakBronze":
        ttype = AchievementType.LOGIN_STREAK_BRONZE;
      case "loginStreakSilver":
        ttype = AchievementType.LOGIN_STREAK_SILVER;
      case "loginStreakGold":
        ttype = AchievementType.LOGIN_STREAK_GOLD;
      case "taskCompletionMaster":
        ttype = AchievementType.TASK_COMPLETION_MASTER;
      case "taskCompletionLeader":
        ttype = AchievementType.TASK_COMPLETION_LEADER;
      case "taskCreatedWithAi":
        ttype = AchievementType.TASK_CREATED_WITH_AI;
      default:
        throw Exception("Unknown achievement type: $type");
    }

    return Achievement(
      id: id,
      name: name,
      description: description,
      type: ttype,
      backgroundColor: backgroundColors[Random().nextInt(backgroundColors.length)],
      condition: condition,
    );
  }
}

//? MARK: UserAchievement

@JsonSerializable()
class GetUserAchievementResponseModel {
  final String id;
  final String userId;
  final String achievementId;
  final DateTime dateAwarded;

  GetUserAchievementResponseModel({
    required this.id,
    required this.userId,
    required this.achievementId,
    required this.dateAwarded,
  });

  factory GetUserAchievementResponseModel.fromJson(Map<String, dynamic> json) => _$GetUserAchievementResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserAchievementResponseModelToJson(this);

  UserAchievement toUserAchievement() {
    return UserAchievement(
      id: id,
      userId: userId,
      achievementId: achievementId,
      dateAwarded: dateAwarded,
    );
  }
}

@JsonSerializable()
class PostUserAchievementRequestModel {
  final String userId;
  final String achievementId;
  final DateTime? dateAwarded;

  PostUserAchievementRequestModel({
    required this.userId,
    required this.achievementId,
    this.dateAwarded,
  });

  factory PostUserAchievementRequestModel.fromJson(Map<String, dynamic> json) => _$PostUserAchievementRequestModelFromJson(json);
  // factory UserAchievementPostRequestModel

  Map<String, dynamic> toJson() => _$PostUserAchievementRequestModelToJson(this);

  factory PostUserAchievementRequestModel.fromUserAchievement(UserAchievement userAchievement) {
    return PostUserAchievementRequestModel(
      userId: userAchievement.userId,
      achievementId: userAchievement.achievementId,
      dateAwarded: userAchievement.dateAwarded,
    );
  }
}
