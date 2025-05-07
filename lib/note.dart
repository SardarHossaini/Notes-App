import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'constants.dart';

enum NoteOption {
  delete,
  save,
}

class Note {
  final String title;
  final String body;
  final DateTime dateTime;
  int lineIndex;
  int index;
  late PopupMenuButton button;
  NoteOption? selectedNoteOption;

  Note(this.title, this.body, this.dateTime, this.lineIndex, this.index);
}
