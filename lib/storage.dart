import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'note.dart';
import 'constants.dart';

class NotesStorage {
  int numberOfNote = 0;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notes.txt');
  }

  Future<File> writeNote(
      String title, String description, String lastEdited) async {
    final file = await _localFile;
    String content = title + "\n" + description + "\n" + lastEdited + "\n";
    return file.writeAsString(content, mode: FileMode.append);
  }

  Future<List<Note>> readNotes() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      List<String> lines = contents.split("\n");
      List<Note> notes = [];

      for (int i = 0; i < lines.length - 1; i += 3) {
        String title = lines[i];
        String description = lines[i + 1];
        String lastEdited = lines[i + 2];
        Note note =
            Note(title, description, DateTime.parse(lastEdited), -1, i ~/ 3);
        notes.add(note);
      }
      return notes;
    } catch (e) {
      return [];
    }
  }
}
