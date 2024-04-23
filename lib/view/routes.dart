import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/add_task/add_task.dart';
import 'package:flutter_application_1/view/task_list/task_list.dart';

final routes = <String, WidgetBuilder>{
  '/': (BuildContext context) => const TaskListScreen(),
  '/addTask': (BuildContext context) => AddTaskScreen(),
};
