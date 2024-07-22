import 'package:flutter/material.dart';
import '../widgets/custom_input_widget.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomInputWidget(label: 'Task Name'),
            CustomInputWidget(label: 'Task Description'),
            CustomInputWidget(label: 'Start Time'),
            CustomInputWidget(label: 'End Time'),
            ElevatedButton(
              onPressed: () {
                // Add task logic
              },
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
