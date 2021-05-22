import 'package:flutter/material.dart';
import 'package:provider_counter_example/models/TaskModel.dart';
import 'package:provider_counter_example/screens/home_page.dart';

// Step 1: Create a class model with ChangeNotifier having all the properties and methods for state in it:
class Counter extends ChangeNotifier {
  List<TaskModel> todos = [];

  void addTodos(TaskModel task) {
    todos.add(task);
    notifyListeners();
  }
  void deleteTodos() {
    todos.clear();
    notifyListeners();
  }
}

class Root extends StatefulWidget {
  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}