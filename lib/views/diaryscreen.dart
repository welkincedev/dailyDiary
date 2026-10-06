import 'package:dailydiary/viewmodels/diary_viewmodel.dart';
import 'package:dailydiary/views/addenrtyview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiaryScreen extends ConsumerWidget {
  const DiaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsyncValue = ref.watch(diaryEntriesStreamProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Daily Diary")),
      body: entriesAsyncValue.when(
        error: (error, stack) =>
            Center(child: Text('Error loading diary: $error')),
        loading: () => Center(child: CircularProgressIndicator()),
        data: (entries) {
          if (entries.isEmpty) {
            return Center(child: Text("Tap + to add your 1st Thought"));
          }

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(
                    entry.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    entry.body,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Text(
                    "${entry.createdAt.day}/${entry.createdAt.month}/${entry.createdAt.year}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEntryView()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
