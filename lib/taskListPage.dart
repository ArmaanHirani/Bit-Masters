import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'taskList.dart';

class TaskListPage extends StatefulWidget {
  final String priority;

  TaskListPage({required this.priority});

  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
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
      if (widget.priority == 'None') {
        _tasks = tasks;
      } else {
        _tasks = tasks.where((task) => task.priority == widget.priority).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Tasks - ${widget.priority}'),
      ),
      body: _tasks.isEmpty
          ? Center(child: Text('No tasks found'))
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index].category),
                  subtitle: Text(_tasks[index].description),
                  trailing: Text(_tasks[index].endDate),
                );
              },
            ),
    );
  }
}
