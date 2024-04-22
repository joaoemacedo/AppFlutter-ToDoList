import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/task_provider.dart';
import 'package:provider/provider.dart';

class DeleteTaskModal extends StatelessWidget {
  final int index;

  const DeleteTaskModal(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Excluir Tarefa'),
      content: const Text('Tem certeza que deseja excluir esta tarefa?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TaskProvider>(context, listen: false).removeTask(index);
            Navigator.of(context).pop();
          },
          child: const Text('Excluir'),
        ),
      ],
    );
  }
}
