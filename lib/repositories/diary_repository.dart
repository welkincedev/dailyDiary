import 'package:dailydiary/database/app_database.dart';

class DiaryRepository {
  final AppDatabase _db;

  DiaryRepository(this._db);

  Stream<List<DiaryEntry>> watchAllEntries() {
    return _db.select(_db.diaryEntries).watch();
  }

  Future<int> addEntry(String title, String body) {
    return _db
        .into(_db.diaryEntries)
        .insert(DiaryEntriesCompanion.insert(title: title, body: body));
  }
}
