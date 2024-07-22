import 'package:flutter/material.dart';
import 'task_details_screen.dart';

class TaskItemWidget extends StatelessWidget {
  final String task;

  TaskItemWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TaskDetailsScreen(taskId: task)),
        );
      },
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          // Delete task logic
        },
      ),
    );
  }
}
