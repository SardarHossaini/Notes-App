import 'package:flutter/material.dart';
import 'package:notes_app/home.dart';
import 'package:notes_app/storage.dart';

void main() {
  runApp(MyApp(storage: NotesStorage()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.storage});
  final NotesStorage storage;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: EditNoteScreen(noteIndex: 0, lineIndex: -1),
      home: MyHomePage(
        title: "Note",
        storage: storage,
      ),
    );
  }
}
