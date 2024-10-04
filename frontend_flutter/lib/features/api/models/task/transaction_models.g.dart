// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostTaskRequestModel _$PostTaskRequestModelFromJson(Map<String, dynamic> json) => PostTaskRequestModel(
      name: json['name'] as String,
      order: (json['order'] as num).toInt(),
      startTime: json['startTime'] == null ? null : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null ? null : DateTime.parse(json['endTime'] as String),
      priority: (json['priority'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PostTaskRequestModelToJson(PostTaskRequestModel instance) => <String, dynamic>{
      'name': instance.name,
      'order': instance.order,
      'startTime': instance.startTime?.toUtc().toIso8601String(),
      'endTime': instance.endTime?.toUtc().toIso8601String(),
      'priority': instance.priority,
    };

GetTaskResponseModel _$GetTaskResponseModelFromJson(Map<String, dynamic> json) => GetTaskResponseModel(
      id: json['id'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
      updatedDate: DateTime.parse(json['updatedDate'] as String),
      name: json['name'] as String,
      notes: json['notes'] as String?,
      order: (json['order'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      startTime: json['startTime'] == null ? null : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null ? null : DateTime.parse(json['endTime'] as String),
      userId: json['userId'] as String,
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$GetTaskResponseModelToJson(GetTaskResponseModel instance) => <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate.toIso8601String(),
      'updatedDate': instance.updatedDate.toIso8601String(),
      'name': instance.name,
      'notes': instance.notes,
      'order': instance.order,
      'status': instance.status,
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'userId': instance.userId,
      'priority': instance.priority,
    };
