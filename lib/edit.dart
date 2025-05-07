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
            onPressed: () {},
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
