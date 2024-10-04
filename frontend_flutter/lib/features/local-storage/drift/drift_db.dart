import 'dart:async';
import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:to_do_go/features/achievements/models/achievement_models.dart';
import 'package:to_do_go/features/todo-list/models/task_models.dart';

part 'drift_db.g.dart';

@DriftDatabase(
  tables: [Achievements, UserAchievements, Tasks],
  daos: [TaskDAO, AchievementDAO, UserAchievementsDAO],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(driftDatabase(name: "local_database.db"));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (Migrator m) async {
        await m.createAll();
      }, onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1 && to == 2) {
          await m.alterTable(TableMigration(tasks));
        }
      });
}

@DataClassName("AchievementDriftClass")
class Achievements extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')(); // String id
  TextColumn get name => text()(); // String name
  TextColumn get description => text()(); // String description
  IntColumn get type => intEnum<AchievementType>()(); // Enum AchievementType stored as an integer
  TextColumn get backgroundColor => text()(); // String backgroundColor
  IntColumn get condition => integer()(); // int condition

  @override
  Set<Column> get primaryKey => {id}; // Use 'id' as the primary key
}

@DataClassName("UserAchievementDriftClass")
class UserAchievements extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')(); // String id
  TextColumn get userId => text()(); // String userId
  TextColumn get achievementId => text()(); // String achievementId
  DateTimeColumn get dateAwarded => dateTime()(); // DateTime dateAwarded

  @override
  Set<Column> get primaryKey => {id}; // Use 'id' as the primary key
}

@DataClassName("TaskDriftClass")
class Tasks extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')(); // String id
  DateTimeColumn get createdDate => dateTime()(); // DateTime createdDate
  DateTimeColumn get updatedDate => dateTime()(); // DateTime updatedDate
  TextColumn get name => text()(); // String name
  TextColumn get notes => text().nullable()(); // String? notes
  IntColumn get order => integer()(); // int order
  IntColumn get status => intEnum<Status>()(); // Enum Status stored as an integer
  DateTimeColumn get startTime => dateTime().nullable()(); // DateTime startTime
  DateTimeColumn get endTime => dateTime().nullable()(); // DateTime endTime
  TextColumn get userId => text()(); // String userId
  IntColumn get priority => intEnum<Priority>()(); // Enum Priority? stored as an integer

  @override
  Set<Column> get primaryKey => {id}; // Use 'id' as the primary key
}

@DriftAccessor(tables: [Tasks])
class TaskDAO extends DatabaseAccessor<LocalDatabase> with _$TaskDAOMixin {
  TaskDAO(LocalDatabase _db) : super(_db);

  Future<List<Task>> fetchTasks() async {
    try {
      final t = await select(tasks).get();
      return t.map(toTask).toList();
    } catch (e) {
      log(e.toString(), error: e, name: "log: Drift: fetchTasks", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return [];
  }

  Future<bool> deleteAllTasks() async {
    try {
      final rows = await tasks.count();
      return await tasks.deleteAll() == rows;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Drift: deleteAllTasks", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<bool> insertTasks(List<Task> tasks) async {
    try {
      await batch((batch) {
        batch.insertAll(this.tasks, tasks.map(fromTask).toList());
      });
      return await getTaskCount() == tasks.length;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Drift: insertTasks", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<int> getTaskCount() async {
    final countQuery = tasks.id.count(); // This creates the count expression
    final result = await (selectOnly(tasks)..addColumns([countQuery])).map((row) => row.read(countQuery)).getSingle();
    return result ?? 0;
  }

  Stream<List<Task>> watchTasks() {
    try {
      return select(tasks).watch().map((event) => event.map(toTask).toList());
    } catch (e) {
      log(e.toString(), error: e, name: "log: Drift: watchTasks", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return Stream.empty();
  }

  Future<bool> addTask(Task task) async {
    try {
      final rowId = await into(tasks).insert(fromTask(task), mode: InsertMode.insertOrRollback);
      return rowId > 0;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Drift: addTask", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<bool> removeTask(Task task) async {
    try {
      final rows = await delete(tasks).delete(fromTask(task));
      return rows > 0;
    } catch (e) {
      log(e.toString(), error: e, name: "log: Drift: removeTask", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Future<bool> updateTask(Task task) async {
    try {
      return await update(tasks).replace(fromTask(task));
    } catch (e) {
      log(e.toString(), error: e, name: "log: Drift: updateTask", stackTrace: StackTrace.current, zone: Zone.current);
    }
    return false;
  }

  Task toTask(TaskDriftClass t) {
    return Task(
      id: t.id,
      createdDate: t.createdDate,
      updatedDate: t.updatedDate,
      name: t.name,
      notes: t.notes,
      order: t.order,
      status: t.status,
      startTime: t.startTime,
      endTime: t.endTime,
      userId: t.userId,
      priority: t.priority,
    );
  }

  TasksCompanion fromTask(Task t) {
    if (t.id.startsWith("db")) {
      return TasksCompanion(
        createdDate: Value(t.createdDate),
        updatedDate: Value(t.updatedDate),
        name: Value(t.name),
        notes: t.notes != null ? Value(t.notes!) : Value.absent(),
        order: Value(t.order),
        status: Value(t.status),
        startTime: t.startTime != null ? Value(t.startTime!) : const Value.absent(),
        endTime: t.endTime != null ? Value(t.endTime!) : const Value.absent(),
        userId: Value(t.userId),
        priority: Value(t.priority ?? Priority.LOW),
      );
    } else {
      return TasksCompanion(
        id: Value(t.id),
        createdDate: Value(t.createdDate),
        updatedDate: Value(t.updatedDate),
        name: Value(t.name),
        notes: t.notes != null ? Value(t.notes!) : Value.absent(),
        order: Value(t.order),
        status: Value(t.status),
        startTime: t.startTime != null ? Value(t.startTime!) : const Value.absent(),
        endTime: t.endTime != null ? Value(t.endTime!) : const Value.absent(),
        userId: Value(t.userId),
        priority: Value(t.priority ?? Priority.LOW),
      );
    }
  }
}

@DriftAccessor(tables: [Achievements])
class AchievementDAO extends DatabaseAccessor<LocalDatabase> with _$AchievementDAOMixin {
  AchievementDAO(LocalDatabase _db) : super(_db);

  Future<List<Achievement>> fetchAchievements() async {
    return await select(achievements).get().then((value) => value.map(toAchievement).toList());
  }

  Stream<List<Achievement>> watchAchievements() {
    return select(achievements).watch().map((event) => event.map(toAchievement).toList());
  }

  Future<bool> addAchievement(Achievement achievement) async {
    final rowId = await into(achievements).insert(fromAchievement(achievement));
    return rowId > 0;
  }

  Future<bool> removeAchievement(Achievement achievement) async {
    return await delete(achievements).delete(fromAchievement(achievement)) > 0;
  }

  Future<bool> updateAchievement(Achievement achievement) async {
    return await update(achievements).replace(fromAchievement(achievement));
  }

  Achievement toAchievement(AchievementDriftClass a) {
    return Achievement(
      id: a.id,
      name: a.name,
      description: a.description,
      type: a.type,
      backgroundColor: a.backgroundColor,
      condition: a.condition,
    );
  }

  AchievementsCompanion fromAchievement(Achievement a) {
    return AchievementsCompanion(
      id: Value(a.id),
      name: Value(a.name),
      description: Value(a.description),
      type: Value(a.type),
      backgroundColor: Value(a.backgroundColor),
      condition: Value(a.condition),
    );
  }
}

@DriftAccessor(tables: [UserAchievements])
class UserAchievementsDAO extends DatabaseAccessor<LocalDatabase> with _$UserAchievementsDAOMixin {
  UserAchievementsDAO(LocalDatabase _db) : super(_db);

  Future<List<UserAchievement>> fetchUserAchievements() async {
    return await select(userAchievements).get().then((value) => value.map(toUserAchievement).toList());
  }

  Stream<List<UserAchievement>> watchUserAchievements() {
    return select(userAchievements).watch().map((event) => event.map(toUserAchievement).toList());
  }

  Future<bool> addUserAchievement(UserAchievement userAchievement) async {
    return await into(userAchievements).insert(fromUserAchievement(userAchievement)) > 0;
  }

  Future<bool> removeUserAchievement(UserAchievement userAchievement) async {
    return await delete(userAchievements).delete(fromUserAchievement(userAchievement)) > 0;
  }

  Future<bool> updateUserAchievement(UserAchievement userAchievement) async {
    return await update(userAchievements).replace(fromUserAchievement(userAchievement));
  }

  UserAchievement toUserAchievement(UserAchievementDriftClass ua) {
    return UserAchievement(
      id: ua.id,
      userId: ua.userId,
      achievementId: ua.achievementId,
      dateAwarded: ua.dateAwarded,
    );
  }

  UserAchievementsCompanion fromUserAchievement(UserAchievement ua) {
    return UserAchievementsCompanion(
      id: Value(ua.id),
      userId: Value(ua.userId),
      achievementId: Value(ua.achievementId),
      dateAwarded: Value(ua.dateAwarded),
    );
  }
}
