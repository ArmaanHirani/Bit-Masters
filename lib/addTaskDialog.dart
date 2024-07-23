import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:task_manager/taskList.dart';

//import 'package:task_manager/taskList.dart';

import 'package:uuid/uuid.dart';

class AddTaskDialog extends StatefulWidget {
  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  String? _category;
  final List<String> _categories = ['Important', 'Work', 'Personal', 'Other'];
  final _descriptionController = TextEditingController();
  String? _priority;
  final List<String> _priorities = ['Low', 'Medium', 'High'];
  final _endDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 700,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Add Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ), // Add a title
                SizedBox(height: 20),
                TextFormField(
                  controller: _taskNameController,
                  decoration: InputDecoration(labelText: 'Task Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a task name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Category'),
                  value: _category,
                  onChanged: (value) {
                    setState(() {
                      _category = value as String?;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                  return null;
                  },
                ),
                SizedBox(height: 40),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Priority'),
                  value: _priority,
                  onChanged: (value) {
                    setState(() {
                      _priority = value as String?;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a priority';
                    }
                    return null;
                  },
                  items: _priorities.map((priority) {
                    return DropdownMenuItem(
                      value: priority,
                      child: Text(priority),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: _endDateController,
                  decoration: InputDecoration(
                    labelText: 'End Date',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            _endDateController.text = DateFormat('MMMM d, y').format(pickedDate);
                          });
                        }
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an end date';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final task = Task(
                        id: Uuid().v4(), // Generate a unique ID for the task
                        category: _category!,
                        description: _descriptionController.text,
                        priority: _priority!,
                        endDate: _endDateController.text,
                        userId: FirebaseAuth.instance.currentUser!.uid, // Get the current user's ID
                      );

                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(task.userId)
                          .collection('tasks')
                          .doc(task.id)
                          .set(task.toMap()); // Save the task to Firestore

                      Navigator.pop(context);
                    }
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }

}

}
