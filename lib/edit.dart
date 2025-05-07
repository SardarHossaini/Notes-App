import 'dart:html';

import 'package:flutter/material.dart';

import 'constants.dart';
import 'note.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
    required this.noteIndex,
    required this.lineIndex,
  });
  final int noteIndex;
  final int lineIndex;
  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  bool isNewNote = false;
  int index = -1;
  int lineIndex = -1;
  @override
  void initState() {
    super.initState();
    index = widget.noteIndex;
    lineIndex = widget.lineIndex;
    isNewNote = index == -1;
    if (isNewNote) {
      titleEditingController.text = NEW_NOTE_TITLE;
      descriptionEditingController.text = NEW_NOTE_BODY;
    }
  }

  void saveNote() async {
    String lastEditedDate = DateTime.now().toString();
    index = widget.noteIndex;
    if (index == -1) {
      await widget.storage.write(titleEditingController.text,
          descriptionEditingController.text, lastEditedDate);
      // Add the note to the list of notes
    }
    List<Note> notes = widget.storage.readNotes();
    notes.forEach((element) => print(element.title +
        " " +
        element.body +
        " " +
        element.dateTime.toString()));
    // Update the note in the list of notes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          CREATE_NEW_NOTE,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: YELLOW,
        foregroundColor: BLACK,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              saveNote();
              Navigator.pop(context);
            },
            tooltip: SAVE,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
            tooltip: DELETE,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 650,
              child: TextField(
                controller: titleEditingController,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 650,
              child: TextField(
                keyboardType: TextInputType.multiline,
                controller: descriptionEditingController,
                maxLines: NUMBER_OF_LINE_FOR_NOTE,
                decoration: InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
