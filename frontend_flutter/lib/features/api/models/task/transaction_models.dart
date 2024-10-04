import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_go/core/user_session.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';

part 'transaction_models.g.dart';

@JsonSerializable()
class PostTaskRequestModel {
  final String name;
  final int order;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? priority;

  PostTaskRequestModel({
    required this.name,
    required this.order,
    this.startTime,
    this.endTime,
    this.priority,
  });

  factory PostTaskRequestModel.fromTask(Task task) {
    return PostTaskRequestModel(
      name: task.name,
      order: task.order,
      startTime: task.startTime,
      endTime: task.endTime,
      priority: task.priority?.toInt,
    );
  }

  factory PostTaskRequestModel.fromJson(Map<String, dynamic> json) => _$PostTaskRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostTaskRequestModelToJson(this);
}

class UpdateTaskRequestModel {
  final String id;
  final String? name;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? priority;
  final int? status;
  final int? order;

  UpdateTaskRequestModel({
    required this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.priority,
    this.status,
    this.order,
  });

  factory UpdateTaskRequestModel.fromTask(Task task) {
    return UpdateTaskRequestModel(
      id: task.id,
      name: task.name,
      startTime: task.startTime,
      endTime: task.endTime,
      priority: task.priority?.toInt,
      status: task.status.toInt,
      order: task.order,
    );
  }

  factory UpdateTaskRequestModel.fromJson(Map<String, dynamic> json) => UpdateTaskRequestModel(
        id: json['id'] as String,
        name: json['name'] as String?,
        startTime: json['startTime'] == null ? null : DateTime.parse(json['startTime'] as String),
        endTime: json['endTime'] == null ? null : DateTime.parse(json['endTime'] as String),
        priority: (json['priority'] as num?)?.toInt(),
        status: (json['status'] as num?)?.toInt(),
        order: (json['order'] as num?)?.toInt(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'startTime': startTime?.toIso8601String(),
        'endTime': endTime?.toIso8601String(),
        'priority': priority,
        'status': status,
        'order': order,
      };
}

@JsonSerializable()
class GetTaskResponseModel {
  final String id;
  final DateTime createdDate;
  final DateTime updatedDate;
  final String name;
  final String? notes;
  final int order;
  final int status;
  final DateTime? startTime;
  final DateTime? endTime;
  final String userId;
  final int priority;

  GetTaskResponseModel({
    required this.id,
    required this.createdDate,
    required this.updatedDate,
    required this.name,
    this.notes,
    required this.order,
    required this.status,
    this.startTime,
    this.endTime,
    required this.userId,
    required this.priority,
  });

  Task toTask() {
    return Task(
      id: id,
      createdDate: createdDate,
      updatedDate: updatedDate,
      name: name,
      notes: notes,
      order: order,
      status: status.toStatus,
      startTime: startTime,
      endTime: endTime,
      userId: userId,
      priority: priority.toPriority,
    );
  }

  factory GetTaskResponseModel.fromJson(Map<String, dynamic> json) => GetTaskResponseModel(
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

  Map<String, dynamic> toJson() => _$GetTaskResponseModelToJson(this);
}

class GetAiTasksResponseModel {
  final String task;
  final String startTime;
  final String endTime;

  GetAiTasksResponseModel({
    required this.task,
    required this.startTime,
    required this.endTime,
  });

  factory GetAiTasksResponseModel.fromJson(Map<String, dynamic> json) => GetAiTasksResponseModel(
        task: json['task'] as String,
        startTime: json['startTime'] as String,
        endTime: json['endTime'] as String,
      );

  Task toTask() {
    final DateTime now = DateTime.now();
    final DateTime sstartTime = now.copyWith(hour: int.parse(startTime.split(":")[0]), minute: int.parse(startTime.split(":")[1]));
    final DateTime eendTime = now.copyWith(hour: int.parse(endTime.split(":")[0]), minute: int.parse(endTime.split(":")[1]));
    return Task(
      id: "ai_$task\_$sstartTime",
      createdDate: DateTime.now(),
      updatedDate: DateTime.now(),
      name: task,
      notes: null,
      order: 0,
      status: Status.OPEN,
      startTime: sstartTime,
      endTime: eendTime,
      userId: GetIt.I.get<UserSession>().activeUser?.id ?? "0",
      priority: Priority.LOW,
    );
  }
}
