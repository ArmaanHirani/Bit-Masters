import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final tasksRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('tasks');

    final tasksSnapshot = await tasksRef.get();
    final tasks = tasksSnapshot.docs.map((doc) => Task.fromMap(doc.data())).toList();

    setState(() {
      _tasks = tasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_tasks[index].category),
          subtitle: Text(_tasks[index].description),
          trailing: Text(_tasks[index].endDate),
        );
      },
    );
  }
}

class Task {
  String id;
  String category;
  String description;
  String priority;
  String endDate;
  String userId; // Add this field to store the user's ID

  Task({
    required this.id,
    required this.category,
    required this.description,
    required this.priority,
    required this.endDate,
    required this.userId,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      category: map['category'],
      description: map['description'],
      priority: map['priority'],
      endDate: map['endDate'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'description': description,
      'priority': priority,
      'endDate': endDate,
      'userId': userId,
    };
  }
}
