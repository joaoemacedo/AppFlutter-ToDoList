import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/task_provider.dart';
import 'package:flutter_application_1/view/task_list/task_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        title: 'Lista de Tarefas',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.amber,
          hintColor: Colors.amberAccent,
        ),
        home: const TaskListScreen(),
      ),
    );
  }
}
