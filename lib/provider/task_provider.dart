import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index].isChecked = !tasks[index].isChecked;
    notifyListeners();
  }
}
