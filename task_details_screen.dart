import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatelessWidget {
  final String taskId;

  TaskDetailsScreen({required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Center(
        child: Text('Details for Task ID: $taskId'),
      ),
    );
  }
}
