// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAchievementResponseModel _$GetAchievementResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAchievementResponseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      condition: (json['condition'] as num).toInt(),
    );

Map<String, dynamic> _$GetAchievementResponseModelToJson(
        GetAchievementResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'condition': instance.condition,
    };

GetUserAchievementResponseModel _$GetUserAchievementResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetUserAchievementResponseModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      achievementId: json['achievementId'] as String,
      dateAwarded: DateTime.parse(json['dateAwarded'] as String),
    );

Map<String, dynamic> _$GetUserAchievementResponseModelToJson(
        GetUserAchievementResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'achievementId': instance.achievementId,
      'dateAwarded': instance.dateAwarded.toIso8601String(),
    };

PostUserAchievementRequestModel _$PostUserAchievementRequestModelFromJson(
        Map<String, dynamic> json) =>
    PostUserAchievementRequestModel(
      userId: json['userId'] as String,
      achievementId: json['achievementId'] as String,
      dateAwarded: json['dateAwarded'] == null
          ? null
          : DateTime.parse(json['dateAwarded'] as String),
    );

Map<String, dynamic> _$PostUserAchievementRequestModelToJson(
        PostUserAchievementRequestModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'achievementId': instance.achievementId,
      'dateAwarded': instance.dateAwarded?.toIso8601String(),
    };
