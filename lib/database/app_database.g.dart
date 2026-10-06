// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DiaryEntriesTable extends DiaryEntries
    with TableInfo<$DiaryEntriesTable, DiaryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiaryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 250,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _backendIdMeta = const VerificationMeta(
    'backendId',
  );
  @override
  late final GeneratedColumn<String> backendId = GeneratedColumn<String>(
    'backend_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<SyncState, int> syncState =
      GeneratedColumn<int>(
        'sync_state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(1),
      ).withConverter<SyncState>($DiaryEntriesTable.$convertersyncState);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    body,
    createdAt,
    backendId,
    tags,
    syncState,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'diary_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<DiaryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('backend_id')) {
      context.handle(
        _backendIdMeta,
        backendId.isAcceptableOrUnknown(data['backend_id']!, _backendIdMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiaryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiaryEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      backendId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}backend_id'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      syncState: $DiaryEntriesTable.$convertersyncState.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}sync_state'],
        )!,
      ),
    );
  }

  @override
  $DiaryEntriesTable createAlias(String alias) {
    return $DiaryEntriesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SyncState, int, int> $convertersyncState =
      const EnumIndexConverter<SyncState>(SyncState.values);
}

class DiaryEntry extends DataClass implements Insertable<DiaryEntry> {
  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final String? backendId;
  final String? tags;
  final SyncState syncState;
  const DiaryEntry({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.backendId,
    this.tags,
    required this.syncState,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(body);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || backendId != null) {
      map['backend_id'] = Variable<String>(backendId);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    {
      map['sync_state'] = Variable<int>(
        $DiaryEntriesTable.$convertersyncState.toSql(syncState),
      );
    }
    return map;
  }

  DiaryEntriesCompanion toCompanion(bool nullToAbsent) {
    return DiaryEntriesCompanion(
      id: Value(id),
      title: Value(title),
      body: Value(body),
      createdAt: Value(createdAt),
      backendId: backendId == null && nullToAbsent
          ? const Value.absent()
          : Value(backendId),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      syncState: Value(syncState),
    );
  }

  factory DiaryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiaryEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      body: serializer.fromJson<String>(json['body']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      backendId: serializer.fromJson<String?>(json['backendId']),
      tags: serializer.fromJson<String?>(json['tags']),
      syncState: $DiaryEntriesTable.$convertersyncState.fromJson(
        serializer.fromJson<int>(json['syncState']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'body': serializer.toJson<String>(body),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'backendId': serializer.toJson<String?>(backendId),
      'tags': serializer.toJson<String?>(tags),
      'syncState': serializer.toJson<int>(
        $DiaryEntriesTable.$convertersyncState.toJson(syncState),
      ),
    };
  }

  DiaryEntry copyWith({
    int? id,
    String? title,
    String? body,
    DateTime? createdAt,
    Value<String?> backendId = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    SyncState? syncState,
  }) => DiaryEntry(
    id: id ?? this.id,
    title: title ?? this.title,
    body: body ?? this.body,
    createdAt: createdAt ?? this.createdAt,
    backendId: backendId.present ? backendId.value : this.backendId,
    tags: tags.present ? tags.value : this.tags,
    syncState: syncState ?? this.syncState,
  );
  DiaryEntry copyWithCompanion(DiaryEntriesCompanion data) {
    return DiaryEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      body: data.body.present ? data.body.value : this.body,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      backendId: data.backendId.present ? data.backendId.value : this.backendId,
      tags: data.tags.present ? data.tags.value : this.tags,
      syncState: data.syncState.present ? data.syncState.value : this.syncState,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('backendId: $backendId, ')
          ..write('tags: $tags, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, body, createdAt, backendId, tags, syncState);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiaryEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.body == this.body &&
          other.createdAt == this.createdAt &&
          other.backendId == this.backendId &&
          other.tags == this.tags &&
          other.syncState == this.syncState);
}

class DiaryEntriesCompanion extends UpdateCompanion<DiaryEntry> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> body;
  final Value<DateTime> createdAt;
  final Value<String?> backendId;
  final Value<String?> tags;
  final Value<SyncState> syncState;
  const DiaryEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.body = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.backendId = const Value.absent(),
    this.tags = const Value.absent(),
    this.syncState = const Value.absent(),
  });
  DiaryEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String body,
    this.createdAt = const Value.absent(),
    this.backendId = const Value.absent(),
    this.tags = const Value.absent(),
    this.syncState = const Value.absent(),
  }) : title = Value(title),
       body = Value(body);
  static Insertable<DiaryEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? body,
    Expression<DateTime>? createdAt,
    Expression<String>? backendId,
    Expression<String>? tags,
    Expression<int>? syncState,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (body != null) 'body': body,
      if (createdAt != null) 'created_at': createdAt,
      if (backendId != null) 'backend_id': backendId,
      if (tags != null) 'tags': tags,
      if (syncState != null) 'sync_state': syncState,
    });
  }

  DiaryEntriesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? body,
    Value<DateTime>? createdAt,
    Value<String?>? backendId,
    Value<String?>? tags,
    Value<SyncState>? syncState,
  }) {
    return DiaryEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
      backendId: backendId ?? this.backendId,
      tags: tags ?? this.tags,
      syncState: syncState ?? this.syncState,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (backendId.present) {
      map['backend_id'] = Variable<String>(backendId.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (syncState.present) {
      map['sync_state'] = Variable<int>(
        $DiaryEntriesTable.$convertersyncState.toSql(syncState.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiaryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('body: $body, ')
          ..write('createdAt: $createdAt, ')
          ..write('backendId: $backendId, ')
          ..write('tags: $tags, ')
          ..write('syncState: $syncState')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DiaryEntriesTable diaryEntries = $DiaryEntriesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [diaryEntries];
}

typedef $$DiaryEntriesTableCreateCompanionBuilder =
    DiaryEntriesCompanion Function({
      Value<int> id,
      required String title,
      required String body,
      Value<DateTime> createdAt,
      Value<String?> backendId,
      Value<String?> tags,
      Value<SyncState> syncState,
    });
typedef $$DiaryEntriesTableUpdateCompanionBuilder =
    DiaryEntriesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> body,
      Value<DateTime> createdAt,
      Value<String?> backendId,
      Value<String?> tags,
      Value<SyncState> syncState,
    });

class $$DiaryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get backendId => $composableBuilder(
    column: $table.backendId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SyncState, SyncState, int> get syncState =>
      $composableBuilder(
        column: $table.syncState,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$DiaryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get backendId => $composableBuilder(
    column: $table.backendId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncState => $composableBuilder(
    column: $table.syncState,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DiaryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiaryEntriesTable> {
  $$DiaryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get backendId =>
      $composableBuilder(column: $table.backendId, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SyncState, int> get syncState =>
      $composableBuilder(column: $table.syncState, builder: (column) => column);
}

class $$DiaryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DiaryEntriesTable,
          DiaryEntry,
          $$DiaryEntriesTableFilterComposer,
          $$DiaryEntriesTableOrderingComposer,
          $$DiaryEntriesTableAnnotationComposer,
          $$DiaryEntriesTableCreateCompanionBuilder,
          $$DiaryEntriesTableUpdateCompanionBuilder,
          (
            DiaryEntry,
            BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntry>,
          ),
          DiaryEntry,
          PrefetchHooks Function()
        > {
  $$DiaryEntriesTableTableManager(_$AppDatabase db, $DiaryEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiaryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiaryEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiaryEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> backendId = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<SyncState> syncState = const Value.absent(),
              }) => DiaryEntriesCompanion(
                id: id,
                title: title,
                body: body,
                createdAt: createdAt,
                backendId: backendId,
                tags: tags,
                syncState: syncState,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String body,
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> backendId = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<SyncState> syncState = const Value.absent(),
              }) => DiaryEntriesCompanion.insert(
                id: id,
                title: title,
                body: body,
                createdAt: createdAt,
                backendId: backendId,
                tags: tags,
                syncState: syncState,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DiaryEntriesTable, DiaryEntry>(table),
                  BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntry>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DiaryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DiaryEntriesTable,
      DiaryEntry,
      $$DiaryEntriesTableFilterComposer,
      $$DiaryEntriesTableOrderingComposer,
      $$DiaryEntriesTableAnnotationComposer,
      $$DiaryEntriesTableCreateCompanionBuilder,
      $$DiaryEntriesTableUpdateCompanionBuilder,
      (
        DiaryEntry,
        BaseReferences<_$AppDatabase, $DiaryEntriesTable, DiaryEntry>,
      ),
      DiaryEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DiaryEntriesTableTableManager get diaryEntries =>
      $$DiaryEntriesTableTableManager(_db, _db.diaryEntries);
}
