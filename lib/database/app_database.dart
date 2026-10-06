import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
part 'app_database.g.dart';

enum SyncState {
  synced, // 0: Perfectly matched with the cloud
  created, // 1: New on this phone, needs to go to cloud
  updated, // 2: Edited on this phone, needs to go to cloud
  deleted, // 3: Trashed on this phone, needs to be deleted from cloud
}

class DiaryEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 250)();
  TextColumn get body => text()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  TextColumn get backendId => text().nullable()();
  TextColumn get tags => text().nullable()();

  IntColumn get syncState => intEnum<SyncState>().withDefault(const Constant(1))(); 
}

@DriftDatabase(tables: [DiaryEntries])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'diary_app_db'));

  @override
  int get schemaVersion => 1;
}