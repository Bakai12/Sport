import 'package:flutter/material.dart';
import 'package:pro_sport/locale/app_localizations.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final TextEditingController _noteController = TextEditingController();
  final List<String> _notes = [
    'Workout plan for this week',
    'Buy new running shoes',
    'Increase protein intake',
    'Leg day was amazing today!',
    'Track progress: Squat 100kg',
  ];

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale?.notes ?? 'Notes',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Input Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale?.enterYourNote ?? 'Enter your note',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _noteController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: locale?.typeYourNote ?? 'Type your note here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                  style: TextStyle(
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _addNote,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      locale?.addNote ?? 'Add Note',
                      style: TextStyle(
                        fontSize: 18,
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Notes List
          Expanded(
            child: _notes.isEmpty
                ? Center(
                    child: Text(
                      locale?.noNotesYet ?? 'No notes yet',
                      style: TextStyle(
                        fontSize: 18,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _notes.length,
                    itemBuilder: (context, index) {
                      return _buildNoteItem(_notes[index], index, locale, theme);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoteItem(String note, int index, AppLocalizations? locale, ThemeData theme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: theme.cardTheme.color,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          note,
          style: TextStyle(
            fontSize: 16,
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: theme.textTheme.bodySmall?.color,
          ),
          onPressed: () => _deleteNote(index, locale),
        ),
        onTap: () {
          _editNote(index, note, locale);
        },
      ),
    );
  }

  void _addNote() {
    if (_noteController.text.trim().isNotEmpty) {
      setState(() {
        _notes.add(_noteController.text);
        _noteController.clear();
      });
      FocusScope.of(context).unfocus();
    }
  }

  void _deleteNote(int index, AppLocalizations? locale) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(locale?.deleteNote ?? 'Delete Note'),
        content: Text(locale?.areYouSureDelete ?? 'Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(locale?.cancel ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _notes.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text(
              locale?.delete ?? 'Delete',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _editNote(int index, String currentNote, AppLocalizations? locale) {
    _noteController.text = currentNote;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(locale?.editNote ?? 'Edit Note'),
        content: TextField(
          controller: _noteController,
          maxLines: 3,
          autofocus: true,
          decoration: InputDecoration(
            hintText: locale?.editYourNote ?? 'Edit your note...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(locale?.cancel ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_noteController.text.trim().isNotEmpty) {
                setState(() {
                  _notes[index] = _noteController.text;
                });
                _noteController.clear();
                Navigator.pop(context);
              }
            },
            child: Text(locale?.save ?? 'Save'),
          ),
        ],
      ),
    );
  }
}