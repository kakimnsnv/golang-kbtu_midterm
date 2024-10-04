// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $AchievementsTable extends Achievements
    with TableInfo<$AchievementsTable, AchievementDriftClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumnWithTypeConverter<AchievementType, int> type =
      GeneratedColumn<int>('type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<AchievementType>($AchievementsTable.$convertertype);
  static const VerificationMeta _backgroundColorMeta =
      const VerificationMeta('backgroundColor');
  @override
  late final GeneratedColumn<String> backgroundColor = GeneratedColumn<String>(
      'background_color', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _conditionMeta =
      const VerificationMeta('condition');
  @override
  late final GeneratedColumn<int> condition = GeneratedColumn<int>(
      'condition', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, type, backgroundColor, condition];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'achievements';
  @override
  VerificationContext validateIntegrity(
      Insertable<AchievementDriftClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('background_color')) {
      context.handle(
          _backgroundColorMeta,
          backgroundColor.isAcceptableOrUnknown(
              data['background_color']!, _backgroundColorMeta));
    } else if (isInserting) {
      context.missing(_backgroundColorMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(_conditionMeta,
          condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta));
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AchievementDriftClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AchievementDriftClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      type: $AchievementsTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!),
      backgroundColor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}background_color'])!,
      condition: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}condition'])!,
    );
  }

  @override
  $AchievementsTable createAlias(String alias) {
    return $AchievementsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<AchievementType, int, int> $convertertype =
      const EnumIndexConverter<AchievementType>(AchievementType.values);
}

class AchievementDriftClass extends DataClass
    implements Insertable<AchievementDriftClass> {
  final String id;
  final String name;
  final String description;
  final AchievementType type;
  final String backgroundColor;
  final int condition;
  const AchievementDriftClass(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.backgroundColor,
      required this.condition});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    {
      map['type'] =
          Variable<int>($AchievementsTable.$convertertype.toSql(type));
    }
    map['background_color'] = Variable<String>(backgroundColor);
    map['condition'] = Variable<int>(condition);
    return map;
  }

  AchievementsCompanion toCompanion(bool nullToAbsent) {
    return AchievementsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      type: Value(type),
      backgroundColor: Value(backgroundColor),
      condition: Value(condition),
    );
  }

  factory AchievementDriftClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AchievementDriftClass(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      type: $AchievementsTable.$convertertype
          .fromJson(serializer.fromJson<int>(json['type'])),
      backgroundColor: serializer.fromJson<String>(json['backgroundColor']),
      condition: serializer.fromJson<int>(json['condition']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'type': serializer
          .toJson<int>($AchievementsTable.$convertertype.toJson(type)),
      'backgroundColor': serializer.toJson<String>(backgroundColor),
      'condition': serializer.toJson<int>(condition),
    };
  }

  AchievementDriftClass copyWith(
          {String? id,
          String? name,
          String? description,
          AchievementType? type,
          String? backgroundColor,
          int? condition}) =>
      AchievementDriftClass(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        type: type ?? this.type,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        condition: condition ?? this.condition,
      );
  AchievementDriftClass copyWithCompanion(AchievementsCompanion data) {
    return AchievementDriftClass(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      backgroundColor: data.backgroundColor.present
          ? data.backgroundColor.value
          : this.backgroundColor,
      condition: data.condition.present ? data.condition.value : this.condition,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AchievementDriftClass(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('condition: $condition')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, type, backgroundColor, condition);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AchievementDriftClass &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.backgroundColor == this.backgroundColor &&
          other.condition == this.condition);
}

class AchievementsCompanion extends UpdateCompanion<AchievementDriftClass> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> description;
  final Value<AchievementType> type;
  final Value<String> backgroundColor;
  final Value<int> condition;
  final Value<int> rowid;
  const AchievementsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.backgroundColor = const Value.absent(),
    this.condition = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AchievementsCompanion.insert({
    required String id,
    required String name,
    required String description,
    required AchievementType type,
    required String backgroundColor,
    required int condition,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        description = Value(description),
        type = Value(type),
        backgroundColor = Value(backgroundColor),
        condition = Value(condition);
  static Insertable<AchievementDriftClass> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? type,
    Expression<String>? backgroundColor,
    Expression<int>? condition,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (backgroundColor != null) 'background_color': backgroundColor,
      if (condition != null) 'condition': condition,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AchievementsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? description,
      Value<AchievementType>? type,
      Value<String>? backgroundColor,
      Value<int>? condition,
      Value<int>? rowid}) {
    return AchievementsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      condition: condition ?? this.condition,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] =
          Variable<int>($AchievementsTable.$convertertype.toSql(type.value));
    }
    if (backgroundColor.present) {
      map['background_color'] = Variable<String>(backgroundColor.value);
    }
    if (condition.present) {
      map['condition'] = Variable<int>(condition.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AchievementsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('backgroundColor: $backgroundColor, ')
          ..write('condition: $condition, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserAchievementsTable extends UserAchievements
    with TableInfo<$UserAchievementsTable, UserAchievementDriftClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAchievementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _achievementIdMeta =
      const VerificationMeta('achievementId');
  @override
  late final GeneratedColumn<String> achievementId = GeneratedColumn<String>(
      'achievement_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateAwardedMeta =
      const VerificationMeta('dateAwarded');
  @override
  late final GeneratedColumn<DateTime> dateAwarded = GeneratedColumn<DateTime>(
      'date_awarded', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, achievementId, dateAwarded];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_achievements';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserAchievementDriftClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('achievement_id')) {
      context.handle(
          _achievementIdMeta,
          achievementId.isAcceptableOrUnknown(
              data['achievement_id']!, _achievementIdMeta));
    } else if (isInserting) {
      context.missing(_achievementIdMeta);
    }
    if (data.containsKey('date_awarded')) {
      context.handle(
          _dateAwardedMeta,
          dateAwarded.isAcceptableOrUnknown(
              data['date_awarded']!, _dateAwardedMeta));
    } else if (isInserting) {
      context.missing(_dateAwardedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserAchievementDriftClass map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAchievementDriftClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      achievementId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}achievement_id'])!,
      dateAwarded: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date_awarded'])!,
    );
  }

  @override
  $UserAchievementsTable createAlias(String alias) {
    return $UserAchievementsTable(attachedDatabase, alias);
  }
}

class UserAchievementDriftClass extends DataClass
    implements Insertable<UserAchievementDriftClass> {
  final String id;
  final String userId;
  final String achievementId;
  final DateTime dateAwarded;
  const UserAchievementDriftClass(
      {required this.id,
      required this.userId,
      required this.achievementId,
      required this.dateAwarded});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['user_id'] = Variable<String>(userId);
    map['achievement_id'] = Variable<String>(achievementId);
    map['date_awarded'] = Variable<DateTime>(dateAwarded);
    return map;
  }

  UserAchievementsCompanion toCompanion(bool nullToAbsent) {
    return UserAchievementsCompanion(
      id: Value(id),
      userId: Value(userId),
      achievementId: Value(achievementId),
      dateAwarded: Value(dateAwarded),
    );
  }

  factory UserAchievementDriftClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAchievementDriftClass(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      achievementId: serializer.fromJson<String>(json['achievementId']),
      dateAwarded: serializer.fromJson<DateTime>(json['dateAwarded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'achievementId': serializer.toJson<String>(achievementId),
      'dateAwarded': serializer.toJson<DateTime>(dateAwarded),
    };
  }

  UserAchievementDriftClass copyWith(
          {String? id,
          String? userId,
          String? achievementId,
          DateTime? dateAwarded}) =>
      UserAchievementDriftClass(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        achievementId: achievementId ?? this.achievementId,
        dateAwarded: dateAwarded ?? this.dateAwarded,
      );
  UserAchievementDriftClass copyWithCompanion(UserAchievementsCompanion data) {
    return UserAchievementDriftClass(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      achievementId: data.achievementId.present
          ? data.achievementId.value
          : this.achievementId,
      dateAwarded:
          data.dateAwarded.present ? data.dateAwarded.value : this.dateAwarded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAchievementDriftClass(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('achievementId: $achievementId, ')
          ..write('dateAwarded: $dateAwarded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, achievementId, dateAwarded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAchievementDriftClass &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.achievementId == this.achievementId &&
          other.dateAwarded == this.dateAwarded);
}

class UserAchievementsCompanion
    extends UpdateCompanion<UserAchievementDriftClass> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> achievementId;
  final Value<DateTime> dateAwarded;
  final Value<int> rowid;
  const UserAchievementsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.achievementId = const Value.absent(),
    this.dateAwarded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAchievementsCompanion.insert({
    required String id,
    required String userId,
    required String achievementId,
    required DateTime dateAwarded,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        achievementId = Value(achievementId),
        dateAwarded = Value(dateAwarded);
  static Insertable<UserAchievementDriftClass> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? achievementId,
    Expression<DateTime>? dateAwarded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (achievementId != null) 'achievement_id': achievementId,
      if (dateAwarded != null) 'date_awarded': dateAwarded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAchievementsCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? achievementId,
      Value<DateTime>? dateAwarded,
      Value<int>? rowid}) {
    return UserAchievementsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      achievementId: achievementId ?? this.achievementId,
      dateAwarded: dateAwarded ?? this.dateAwarded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (achievementId.present) {
      map['achievement_id'] = Variable<String>(achievementId.value);
    }
    if (dateAwarded.present) {
      map['date_awarded'] = Variable<DateTime>(dateAwarded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAchievementsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('achievementId: $achievementId, ')
          ..write('dateAwarded: $dateAwarded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, TaskDriftClass> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedDateMeta =
      const VerificationMeta('updatedDate');
  @override
  late final GeneratedColumn<DateTime> updatedDate = GeneratedColumn<DateTime>(
      'updated_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<Status, int> status =
      GeneratedColumn<int>('status', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Status>($TasksTable.$converterstatus);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumnWithTypeConverter<Priority, int> priority =
      GeneratedColumn<int>('priority', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Priority>($TasksTable.$converterpriority);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        createdDate,
        updatedDate,
        name,
        notes,
        order,
        status,
        startTime,
        endTime,
        userId,
        priority
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<TaskDriftClass> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('updated_date')) {
      context.handle(
          _updatedDateMeta,
          updatedDate.isAcceptableOrUnknown(
              data['updated_date']!, _updatedDateMeta));
    } else if (isInserting) {
      context.missing(_updatedDateMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    context.handle(_priorityMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TaskDriftClass map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskDriftClass(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      updatedDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_date'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      status: $TasksTable.$converterstatus.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!),
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time']),
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time']),
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      priority: $TasksTable.$converterpriority.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Status, int, int> $converterstatus =
      const EnumIndexConverter<Status>(Status.values);
  static JsonTypeConverter2<Priority, int, int> $converterpriority =
      const EnumIndexConverter<Priority>(Priority.values);
}

class TaskDriftClass extends DataClass implements Insertable<TaskDriftClass> {
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
  final Priority priority;
  const TaskDriftClass(
      {required this.id,
      required this.createdDate,
      required this.updatedDate,
      required this.name,
      this.notes,
      required this.order,
      required this.status,
      this.startTime,
      this.endTime,
      required this.userId,
      required this.priority});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['updated_date'] = Variable<DateTime>(updatedDate);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['order'] = Variable<int>(order);
    {
      map['status'] = Variable<int>($TasksTable.$converterstatus.toSql(status));
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['user_id'] = Variable<String>(userId);
    {
      map['priority'] =
          Variable<int>($TasksTable.$converterpriority.toSql(priority));
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      createdDate: Value(createdDate),
      updatedDate: Value(updatedDate),
      name: Value(name),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      order: Value(order),
      status: Value(status),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      userId: Value(userId),
      priority: Value(priority),
    );
  }

  factory TaskDriftClass.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskDriftClass(
      id: serializer.fromJson<String>(json['id']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      updatedDate: serializer.fromJson<DateTime>(json['updatedDate']),
      name: serializer.fromJson<String>(json['name']),
      notes: serializer.fromJson<String?>(json['notes']),
      order: serializer.fromJson<int>(json['order']),
      status: $TasksTable.$converterstatus
          .fromJson(serializer.fromJson<int>(json['status'])),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      userId: serializer.fromJson<String>(json['userId']),
      priority: $TasksTable.$converterpriority
          .fromJson(serializer.fromJson<int>(json['priority'])),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'updatedDate': serializer.toJson<DateTime>(updatedDate),
      'name': serializer.toJson<String>(name),
      'notes': serializer.toJson<String?>(notes),
      'order': serializer.toJson<int>(order),
      'status':
          serializer.toJson<int>($TasksTable.$converterstatus.toJson(status)),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'userId': serializer.toJson<String>(userId),
      'priority': serializer
          .toJson<int>($TasksTable.$converterpriority.toJson(priority)),
    };
  }

  TaskDriftClass copyWith(
          {String? id,
          DateTime? createdDate,
          DateTime? updatedDate,
          String? name,
          Value<String?> notes = const Value.absent(),
          int? order,
          Status? status,
          Value<DateTime?> startTime = const Value.absent(),
          Value<DateTime?> endTime = const Value.absent(),
          String? userId,
          Priority? priority}) =>
      TaskDriftClass(
        id: id ?? this.id,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
        name: name ?? this.name,
        notes: notes.present ? notes.value : this.notes,
        order: order ?? this.order,
        status: status ?? this.status,
        startTime: startTime.present ? startTime.value : this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        userId: userId ?? this.userId,
        priority: priority ?? this.priority,
      );
  TaskDriftClass copyWithCompanion(TasksCompanion data) {
    return TaskDriftClass(
      id: data.id.present ? data.id.value : this.id,
      createdDate:
          data.createdDate.present ? data.createdDate.value : this.createdDate,
      updatedDate:
          data.updatedDate.present ? data.updatedDate.value : this.updatedDate,
      name: data.name.present ? data.name.value : this.name,
      notes: data.notes.present ? data.notes.value : this.notes,
      order: data.order.present ? data.order.value : this.order,
      status: data.status.present ? data.status.value : this.status,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      userId: data.userId.present ? data.userId.value : this.userId,
      priority: data.priority.present ? data.priority.value : this.priority,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskDriftClass(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('order: $order, ')
          ..write('status: $status, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('userId: $userId, ')
          ..write('priority: $priority')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdDate, updatedDate, name, notes,
      order, status, startTime, endTime, userId, priority);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskDriftClass &&
          other.id == this.id &&
          other.createdDate == this.createdDate &&
          other.updatedDate == this.updatedDate &&
          other.name == this.name &&
          other.notes == this.notes &&
          other.order == this.order &&
          other.status == this.status &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.userId == this.userId &&
          other.priority == this.priority);
}

class TasksCompanion extends UpdateCompanion<TaskDriftClass> {
  final Value<String> id;
  final Value<DateTime> createdDate;
  final Value<DateTime> updatedDate;
  final Value<String> name;
  final Value<String?> notes;
  final Value<int> order;
  final Value<Status> status;
  final Value<DateTime?> startTime;
  final Value<DateTime?> endTime;
  final Value<String> userId;
  final Value<Priority> priority;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.updatedDate = const Value.absent(),
    this.name = const Value.absent(),
    this.notes = const Value.absent(),
    this.order = const Value.absent(),
    this.status = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.userId = const Value.absent(),
    this.priority = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required DateTime createdDate,
    required DateTime updatedDate,
    required String name,
    this.notes = const Value.absent(),
    required int order,
    required Status status,
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    required String userId,
    required Priority priority,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        createdDate = Value(createdDate),
        updatedDate = Value(updatedDate),
        name = Value(name),
        order = Value(order),
        status = Value(status),
        userId = Value(userId),
        priority = Value(priority);
  static Insertable<TaskDriftClass> custom({
    Expression<String>? id,
    Expression<DateTime>? createdDate,
    Expression<DateTime>? updatedDate,
    Expression<String>? name,
    Expression<String>? notes,
    Expression<int>? order,
    Expression<int>? status,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? userId,
    Expression<int>? priority,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdDate != null) 'created_date': createdDate,
      if (updatedDate != null) 'updated_date': updatedDate,
      if (name != null) 'name': name,
      if (notes != null) 'notes': notes,
      if (order != null) 'order': order,
      if (status != null) 'status': status,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (userId != null) 'user_id': userId,
      if (priority != null) 'priority': priority,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith(
      {Value<String>? id,
      Value<DateTime>? createdDate,
      Value<DateTime>? updatedDate,
      Value<String>? name,
      Value<String?>? notes,
      Value<int>? order,
      Value<Status>? status,
      Value<DateTime?>? startTime,
      Value<DateTime?>? endTime,
      Value<String>? userId,
      Value<Priority>? priority,
      Value<int>? rowid}) {
    return TasksCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (updatedDate.present) {
      map['updated_date'] = Variable<DateTime>(updatedDate.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (status.present) {
      map['status'] =
          Variable<int>($TasksTable.$converterstatus.toSql(status.value));
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (priority.present) {
      map['priority'] =
          Variable<int>($TasksTable.$converterpriority.toSql(priority.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('createdDate: $createdDate, ')
          ..write('updatedDate: $updatedDate, ')
          ..write('name: $name, ')
          ..write('notes: $notes, ')
          ..write('order: $order, ')
          ..write('status: $status, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('userId: $userId, ')
          ..write('priority: $priority, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDatabase extends GeneratedDatabase {
  _$LocalDatabase(QueryExecutor e) : super(e);
  $LocalDatabaseManager get managers => $LocalDatabaseManager(this);
  late final $AchievementsTable achievements = $AchievementsTable(this);
  late final $UserAchievementsTable userAchievements =
      $UserAchievementsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final TaskDAO taskDAO = TaskDAO(this as LocalDatabase);
  late final AchievementDAO achievementDAO =
      AchievementDAO(this as LocalDatabase);
  late final UserAchievementsDAO userAchievementsDAO =
      UserAchievementsDAO(this as LocalDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [achievements, userAchievements, tasks];
}

typedef $$AchievementsTableCreateCompanionBuilder = AchievementsCompanion
    Function({
  required String id,
  required String name,
  required String description,
  required AchievementType type,
  required String backgroundColor,
  required int condition,
  Value<int> rowid,
});
typedef $$AchievementsTableUpdateCompanionBuilder = AchievementsCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> description,
  Value<AchievementType> type,
  Value<String> backgroundColor,
  Value<int> condition,
  Value<int> rowid,
});

class $$AchievementsTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $AchievementsTable> {
  $$AchievementsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<AchievementType, AchievementType, int>
      get type => $state.composableBuilder(
          column: $state.table.type,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<String> get backgroundColor => $state.composableBuilder(
      column: $state.table.backgroundColor,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get condition => $state.composableBuilder(
      column: $state.table.condition,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$AchievementsTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $AchievementsTable> {
  $$AchievementsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get backgroundColor => $state.composableBuilder(
      column: $state.table.backgroundColor,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get condition => $state.composableBuilder(
      column: $state.table.condition,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$AchievementsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $AchievementsTable,
    AchievementDriftClass,
    $$AchievementsTableFilterComposer,
    $$AchievementsTableOrderingComposer,
    $$AchievementsTableCreateCompanionBuilder,
    $$AchievementsTableUpdateCompanionBuilder,
    (
      AchievementDriftClass,
      BaseReferences<_$LocalDatabase, $AchievementsTable, AchievementDriftClass>
    ),
    AchievementDriftClass,
    PrefetchHooks Function()> {
  $$AchievementsTableTableManager(_$LocalDatabase db, $AchievementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$AchievementsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$AchievementsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<AchievementType> type = const Value.absent(),
            Value<String> backgroundColor = const Value.absent(),
            Value<int> condition = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AchievementsCompanion(
            id: id,
            name: name,
            description: description,
            type: type,
            backgroundColor: backgroundColor,
            condition: condition,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String description,
            required AchievementType type,
            required String backgroundColor,
            required int condition,
            Value<int> rowid = const Value.absent(),
          }) =>
              AchievementsCompanion.insert(
            id: id,
            name: name,
            description: description,
            type: type,
            backgroundColor: backgroundColor,
            condition: condition,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AchievementsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $AchievementsTable,
    AchievementDriftClass,
    $$AchievementsTableFilterComposer,
    $$AchievementsTableOrderingComposer,
    $$AchievementsTableCreateCompanionBuilder,
    $$AchievementsTableUpdateCompanionBuilder,
    (
      AchievementDriftClass,
      BaseReferences<_$LocalDatabase, $AchievementsTable, AchievementDriftClass>
    ),
    AchievementDriftClass,
    PrefetchHooks Function()>;
typedef $$UserAchievementsTableCreateCompanionBuilder
    = UserAchievementsCompanion Function({
  required String id,
  required String userId,
  required String achievementId,
  required DateTime dateAwarded,
  Value<int> rowid,
});
typedef $$UserAchievementsTableUpdateCompanionBuilder
    = UserAchievementsCompanion Function({
  Value<String> id,
  Value<String> userId,
  Value<String> achievementId,
  Value<DateTime> dateAwarded,
  Value<int> rowid,
});

class $$UserAchievementsTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $UserAchievementsTable> {
  $$UserAchievementsTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get achievementId => $state.composableBuilder(
      column: $state.table.achievementId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get dateAwarded => $state.composableBuilder(
      column: $state.table.dateAwarded,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserAchievementsTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $UserAchievementsTable> {
  $$UserAchievementsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get achievementId => $state.composableBuilder(
      column: $state.table.achievementId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get dateAwarded => $state.composableBuilder(
      column: $state.table.dateAwarded,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$UserAchievementsTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $UserAchievementsTable,
    UserAchievementDriftClass,
    $$UserAchievementsTableFilterComposer,
    $$UserAchievementsTableOrderingComposer,
    $$UserAchievementsTableCreateCompanionBuilder,
    $$UserAchievementsTableUpdateCompanionBuilder,
    (
      UserAchievementDriftClass,
      BaseReferences<_$LocalDatabase, $UserAchievementsTable,
          UserAchievementDriftClass>
    ),
    UserAchievementDriftClass,
    PrefetchHooks Function()> {
  $$UserAchievementsTableTableManager(
      _$LocalDatabase db, $UserAchievementsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserAchievementsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserAchievementsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> achievementId = const Value.absent(),
            Value<DateTime> dateAwarded = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAchievementsCompanion(
            id: id,
            userId: userId,
            achievementId: achievementId,
            dateAwarded: dateAwarded,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String achievementId,
            required DateTime dateAwarded,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAchievementsCompanion.insert(
            id: id,
            userId: userId,
            achievementId: achievementId,
            dateAwarded: dateAwarded,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserAchievementsTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $UserAchievementsTable,
    UserAchievementDriftClass,
    $$UserAchievementsTableFilterComposer,
    $$UserAchievementsTableOrderingComposer,
    $$UserAchievementsTableCreateCompanionBuilder,
    $$UserAchievementsTableUpdateCompanionBuilder,
    (
      UserAchievementDriftClass,
      BaseReferences<_$LocalDatabase, $UserAchievementsTable,
          UserAchievementDriftClass>
    ),
    UserAchievementDriftClass,
    PrefetchHooks Function()>;
typedef $$TasksTableCreateCompanionBuilder = TasksCompanion Function({
  required String id,
  required DateTime createdDate,
  required DateTime updatedDate,
  required String name,
  Value<String?> notes,
  required int order,
  required Status status,
  Value<DateTime?> startTime,
  Value<DateTime?> endTime,
  required String userId,
  required Priority priority,
  Value<int> rowid,
});
typedef $$TasksTableUpdateCompanionBuilder = TasksCompanion Function({
  Value<String> id,
  Value<DateTime> createdDate,
  Value<DateTime> updatedDate,
  Value<String> name,
  Value<String?> notes,
  Value<int> order,
  Value<Status> status,
  Value<DateTime?> startTime,
  Value<DateTime?> endTime,
  Value<String> userId,
  Value<Priority> priority,
  Value<int> rowid,
});

class $$TasksTableFilterComposer
    extends FilterComposer<_$LocalDatabase, $TasksTable> {
  $$TasksTableFilterComposer(super.$state);
  ColumnFilters<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedDate => $state.composableBuilder(
      column: $state.table.updatedDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Status, Status, int> get status =>
      $state.composableBuilder(
          column: $state.table.status,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Priority, Priority, int> get priority =>
      $state.composableBuilder(
          column: $state.table.priority,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$TasksTableOrderingComposer
    extends OrderingComposer<_$LocalDatabase, $TasksTable> {
  $$TasksTableOrderingComposer(super.$state);
  ColumnOrderings<String> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdDate => $state.composableBuilder(
      column: $state.table.createdDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedDate => $state.composableBuilder(
      column: $state.table.updatedDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get notes => $state.composableBuilder(
      column: $state.table.notes,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startTime => $state.composableBuilder(
      column: $state.table.startTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endTime => $state.composableBuilder(
      column: $state.table.endTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get priority => $state.composableBuilder(
      column: $state.table.priority,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $$TasksTableTableManager extends RootTableManager<
    _$LocalDatabase,
    $TasksTable,
    TaskDriftClass,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (
      TaskDriftClass,
      BaseReferences<_$LocalDatabase, $TasksTable, TaskDriftClass>
    ),
    TaskDriftClass,
    PrefetchHooks Function()> {
  $$TasksTableTableManager(_$LocalDatabase db, $TasksTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$TasksTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$TasksTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<DateTime> createdDate = const Value.absent(),
            Value<DateTime> updatedDate = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<Status> status = const Value.absent(),
            Value<DateTime?> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<Priority> priority = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksCompanion(
            id: id,
            createdDate: createdDate,
            updatedDate: updatedDate,
            name: name,
            notes: notes,
            order: order,
            status: status,
            startTime: startTime,
            endTime: endTime,
            userId: userId,
            priority: priority,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required DateTime createdDate,
            required DateTime updatedDate,
            required String name,
            Value<String?> notes = const Value.absent(),
            required int order,
            required Status status,
            Value<DateTime?> startTime = const Value.absent(),
            Value<DateTime?> endTime = const Value.absent(),
            required String userId,
            required Priority priority,
            Value<int> rowid = const Value.absent(),
          }) =>
              TasksCompanion.insert(
            id: id,
            createdDate: createdDate,
            updatedDate: updatedDate,
            name: name,
            notes: notes,
            order: order,
            status: status,
            startTime: startTime,
            endTime: endTime,
            userId: userId,
            priority: priority,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$TasksTableProcessedTableManager = ProcessedTableManager<
    _$LocalDatabase,
    $TasksTable,
    TaskDriftClass,
    $$TasksTableFilterComposer,
    $$TasksTableOrderingComposer,
    $$TasksTableCreateCompanionBuilder,
    $$TasksTableUpdateCompanionBuilder,
    (
      TaskDriftClass,
      BaseReferences<_$LocalDatabase, $TasksTable, TaskDriftClass>
    ),
    TaskDriftClass,
    PrefetchHooks Function()>;

class $LocalDatabaseManager {
  final _$LocalDatabase _db;
  $LocalDatabaseManager(this._db);
  $$AchievementsTableTableManager get achievements =>
      $$AchievementsTableTableManager(_db, _db.achievements);
  $$UserAchievementsTableTableManager get userAchievements =>
      $$UserAchievementsTableTableManager(_db, _db.userAchievements);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
}

mixin _$TaskDAOMixin on DatabaseAccessor<LocalDatabase> {
  $TasksTable get tasks => attachedDatabase.tasks;
}
mixin _$AchievementDAOMixin on DatabaseAccessor<LocalDatabase> {
  $AchievementsTable get achievements => attachedDatabase.achievements;
}
mixin _$UserAchievementsDAOMixin on DatabaseAccessor<LocalDatabase> {
  $UserAchievementsTable get userAchievements =>
      attachedDatabase.userAchievements;
}
