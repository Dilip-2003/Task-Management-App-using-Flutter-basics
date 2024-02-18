import 'package:flutter/material.dart';
import 'package:taskmanagementapp/tasklistscreen.dart';

void main(){
  runApp(const TaskManagerApplication());
}

class Task{
  String title;
  String description;
  String category;
  DateTime dueDate;

  Task({
    required this.title,
    required this.description,
    required this.category,
    required this.dueDate
    
  });
}


class TaskManagerApplication extends StatelessWidget {
  const TaskManagerApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: const TaskListScreen(),
    );
  }
}





