import 'package:flutter/material.dart';
import './addTask.dart';

void main() {
  runApp(const MyApp());
}

class Task {
  final String title;
  bool isChecked;

  Task(this.title, {this.isChecked = false});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        hintColor: Colors.amberAccent,
      ),
      home: const TaskListScreen(),
    );
  }
}

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].isChecked = !tasks[index].isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(
              tasks[index].title,
              style: const TextStyle(color: Colors.white),
            ),
            value: tasks[index].isChecked,
            onChanged: (bool? value) {
              toggleTask(index);
            },
            controlAffinity: ListTileControlAffinity.leading,
            activeColor: Colors.amber,
            checkColor: Colors.black,
            secondary: IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () {
                removeTask(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (result != null && result.isNotEmpty) {
            addTask(Task(result));
          }
        },
        tooltip: 'Adicionar Tarefa',
        backgroundColor: Colors.amber, // Altera a cor de fundo do botão para amarelo
        child: const Icon(Icons.add),
      ),
    );
  }
}

