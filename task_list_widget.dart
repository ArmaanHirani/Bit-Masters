import 'package:flutter/material.dart';
import 'task_item_widget.dart';

class TaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your data source
    final tasks = [
      'Task 1',
      'Task 2',
      'Task 3',
    ];

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItemWidget(task: tasks[index]);
      },
    );
  }
}
