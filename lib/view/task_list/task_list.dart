import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/task_provider.dart';
import 'package:flutter_application_1/view/add_task/add_task.dart';
import 'package:flutter_application_1/view/task_list/delete_task_modal.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              var task = taskProvider.tasks[index];
              return ListTile(
                title: Text(
                  task.title,
                  style: const TextStyle(color: Colors.white),
                ),
                leading: Checkbox(
                  value: task.isChecked,
                  onChanged: (bool? value) {
                    taskProvider.toggleTask(index);
                  },
                  activeColor: Colors.amber,
                  checkColor: Colors.black,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => DeleteTaskModal(index),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddTaskScreen()));
        },
        tooltip: 'Adicionar Tarefa',
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}
