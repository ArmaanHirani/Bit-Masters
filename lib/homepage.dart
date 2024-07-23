import 'package:flutter/material.dart';
import 'taskListPage.dart';
import 'addTaskDialog.dart'; // Import the AddTaskDialog file

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String _selectedPriority = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text('Homepage', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            SizedBox(height: 10),
            TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddTaskDialog(),
                );
              },
              child: Text('Add New Task', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskListPage(priority: 'High')),
                    );
                  },
                  child: Text('High'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskListPage(priority: 'Medium')),
                    );
                  },
                  child: Text('Medium'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskListPage(priority: 'Low')),
                    );
                  },
                  child: Text('Low'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskListPage(priority: 'None')),
                    );
                  },
                  child: Text('None'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}