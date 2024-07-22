import 'package:flutter/material.dart';
import 'task_details_screen.dart';
import 'add_task_screen.dart';
import '../widgets/task_list_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Monitor'),
      ),
      body: TaskListWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
