import 'package:dailydiary/database/app_database.dart';
import 'package:dailydiary/repositories/diary_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// 2. Repository Provider
// This watches the databaseProvider and creates our repository.
final diaryRepositoryProvider = Provider<DiaryRepository>((ref) {
  final db = ref.watch(databaseProvider);
  return DiaryRepository(db);
});

// 3. The Diary Entries Stream Provider (Our main ViewModel state)
// This listens to the reactive stream from our repository.
// Whenever an entry is added or deleted, this provider automatically updates the UI!
final diaryEntriesStreamProvider = StreamProvider<List<DiaryEntry>>((ref) {
  final repository = ref.watch(diaryRepositoryProvider);
  return repository.watchAllEntries();
});