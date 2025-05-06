import 'package:flutter/material.dart';
import 'constants.dart';

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
        child: Text('Hello World!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
