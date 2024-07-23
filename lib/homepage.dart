import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'taskList.dart';
import 'addTaskDialog.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 50), // Add padding to the right of the button
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddTaskDialog(),
                );
              },
              child: Text('Add New Task', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)), // Make the text bold and increase the font size
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.yellow],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Expanded(
              child: TaskList(),
            ),
          ],
        ),
      ),
    );
  }
}
