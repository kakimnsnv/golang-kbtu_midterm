import 'package:to_do_go/features/auth-profile/models/user_models.dart';

class Task {
  final String id;
  final DateTime createdDate;
  final DateTime updatedDate;
  final String name;
  final String? notes;
  final int order;
  final Status status;
  final DateTime? startTime;
  final DateTime? endTime;
  final String userId;
  final Priority? priority;

  Task({
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
    this.priority,
  });

  Task copyWith({
    String? id,
    DateTime? createdDate,
    DateTime? updatedDate,
    String? name,
    String? notes,
    int? order,
    Status? status,
    DateTime? startTime,
    DateTime? endTime,
    String? userId,
    Priority? priority,
  }) {
    return Task(
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      order: order ?? this.order,
      status: status ?? this.status,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      userId: userId ?? this.userId,
      priority: priority ?? this.priority,
    );
  }
}

bool compareStatus(Status status1, Status status2) {
  return status1.toInt > status2.toInt;
}

/// Enum for Status
enum Status { OPEN, IN_PROGRESS, COMPLETED, CANCELED }

extension intFromStatus on Status {
  int get toInt {
    switch (this) {
      case Status.OPEN:
        return 0;
      case Status.IN_PROGRESS:
        return 1;
      case Status.COMPLETED:
        return 2;
      case Status.CANCELED:
        return 3;
    }
  }
}

extension statusFromInt on int {
  Status get toStatus {
    switch (this) {
      case 0:
        return Status.OPEN;
      case 1:
        return Status.IN_PROGRESS;
      case 2:
        return Status.COMPLETED;
      case 3:
        return Status.CANCELED;
      default:
        throw Exception("Invalid status");
    }
  }
}

/// Enum for Priority
enum Priority {
  LOW,
  MEDIUM,
  HIGH,
}

extension intFromPriority on Priority {
  int get toInt {
    switch (this) {
      case Priority.LOW:
        return 0;
      case Priority.MEDIUM:
        return 1;
      case Priority.HIGH:
        return 2;
    }
  }
}

extension priorityFromInt on int {
  Priority get toPriority {
    switch (this) {
      case 0:
        return Priority.LOW;
      case 1:
        return Priority.MEDIUM;
      case 2:
        return Priority.HIGH;
      default:
        throw Exception("Invalid priority");
    }
  }
}

Task sampleTask = Task(
  id: "new",
  createdDate: DateTime.now().subtract(Duration(days: 2)),
  updatedDate: DateTime.now(),
  startTime: DateTime.now(),
  endTime: DateTime.now().add(Duration(hours: 2)),
  name: "name",
  order: 1,
  status: Status.OPEN,
  userId: sampleUser.id,
);

Task sampleAiTask = Task(
  id: "ai",
  createdDate: DateTime.now().subtract(Duration(days: 2)),
  updatedDate: DateTime.now(),
  startTime: DateTime.now(),
  endTime: DateTime.now().add(Duration(hours: 2)),
  name: "name",
  order: 1,
  status: Status.OPEN,
  userId: sampleUser.id,
);

// {
//   "id": "",
//   "createdDate": "2024-09-12T09:25:50.665Z",
//   "updatedDate": "2024-09-12T09:25:50.665Z",
//   "name": "name",
//   "order": 1,
//   "status": 0,
//   "userId": "66e2b39e705d13a7577c4ae9",
// }