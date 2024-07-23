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
      body: Row(
        children: [
Expanded(
  flex: 2, // 20% of the screen width
  child: Container(
    color: Color.fromARGB(255, 62, 197, 204),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // evenly spaced
      children: [
        SizedBox(height: 20),
        Text(
          'Task Priority', // add this Text widget
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20), // add some space between the text and the buttons
        Container(
          height: 60, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // make it a rectangle
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskListPage(priority: 'High')),
              );
            },
            child: Text('High'),
          ),
        ),
        Container(
          height: 60, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // make it a rectangle
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskListPage(priority: 'Medium')),
              );
            },
            child: Text('Medium'),
          ),
        ),
        Container(
          height: 60, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // make it a rectangle
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskListPage(priority: 'Low')),
              );
            },
            child: Text('Low'),
          ),
        ),
        Container(
          height: 60, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // make it a rectangle
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TaskListPage(priority: 'None')),
              );
            },
            child: Text('All'),
          ),
        ),
      ],
    ),
  ),
),
          Expanded(
            flex: 8, // 80% of the screen width
            child: Container(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}