import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(TaskMonitorApp());
}

class TaskMonitorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Monitor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
