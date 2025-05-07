import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'constants.dart';

enum NoteOption {
  delete,
  save,
  edit
}

class Note {
  final String title;
  final String body;
  final DateTime lastEdited;
  int lineIndex;
  int index;
  late PopupMenuButton button;
  NoteOption? selectedNoteOption;

  Note(this.title, this.body, this.lastEdited, this.lineIndex, this.index);

  Widget buildTitle(BuildContext context) => Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      );
  Widget buildSubtitle(BuildContext context) => Text.rich(TextSpan(children: [
        TextSpan(text: body),
        TextSpan(
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          text: "\n" +
              "Last Edit: " +
              DateFormat('yyyy-MM-dd | hh:mm:ss').format(lastEdited),
        )
      ]));
  Widget buildButton(BuildContext context) => PopupMenuButton<NoteOption>(
        initialValue: selectedNoteOption,
        onSelected: (NoteOption item) {
          selectedNoteOption = item;
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<NoteOption>>[
          PopupMenuItem<NoteOption>(
            child: Text(EDIT),
            value: NoteOption.edit,
          ),
          PopupMenuItem<NoteOption>(
            child: Text(DELETE),
            value: NoteOption.delete,
          )
        ],
      );
}
