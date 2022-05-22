import 'package:flutter/material.dart';
import 'package:todo_app_using_provider/taskmodel.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskInList() {
    TaskModel taskModel =
        TaskModel("title ${taskList.length}", "this is the task no. details");
    taskList.add(taskModel);
    notifyListeners();
  }
}
