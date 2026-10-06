import 'package:dailydiary/viewmodels/diary_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddEntryView extends ConsumerStatefulWidget {
  const AddEntryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEntryViewState();
}

class _AddEntryViewState extends ConsumerState<AddEntryView> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();
  bool _isSaving = false;

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  Future<void> _saveEntry() async {
    final title = _titleController.text.trim();
    final body = _bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a title and body')),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      final repository = ref.read(diaryRepositoryProvider);
      await repository.addEntry(title, body);
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      setState(() => _isSaving = false);
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error saving: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Entry")),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(),
            ),
            maxLength: 255,
          ),
          SizedBox(height: 16),
          Expanded(
            child: TextField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isSaving ? null : _saveEntry,
              child: _isSaving
                  ? const CircularProgressIndicator()
                  : const Text('Save Entry', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
