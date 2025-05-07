import 'package:flutter/material.dart';
import 'package:notes_app/edit.dart';
import 'package:notes_app/note.dart';
import 'constants.dart';
import 'edit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: YELLOW,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle search action
            },
            tooltip: REMINDER,
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            tooltip: MORE,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: SETTINGS,
                child: Text(SETTINGS),
              ),
              // PopupMenuItem(
              //   value: CREATE_NEW_NOTE,
              //   child: Text(CREATE_NEW_NOTE),
              // ),
              // PopupMenuItem(
              //   value: NOTES,
              //   child: Text(NOTES),
              // ),
            ],
            initialValue: "",
            onSelected: (String item) {
              // openSittingsScreen();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 750,
              child: SearchBar(
                hintText: "Search",
                onChanged: (value) {
                  // Handle search action
                },
                leading: Icon(Icons.search),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: CREATE_NEW_NOTE,
        onPressed: () {
          createNewNote();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Future<void> createNewNote() async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditNoteScreen(
                  noteIndex: -1,
                  lineIndex: 0,
                  // lineIndex: notes.length * NUMBER_OF_LINE_FOR_NOTE
                )));
  }
}
