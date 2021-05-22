import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_example/models/TaskModel.dart';
import 'package:provider_counter_example/state/root.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Step 3: Create an instance of the model using .watch<T> which will rebuild the widget tree at every state change
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
        actions: [
          ElevatedButton(
              onPressed: () {
                // context.watch<Counter>().addTodos(TaskModel("Title 1", "Task 1"));
                Provider.of<Counter>(context, listen: false)
                    .addTodos(TaskModel("Title 1", "Task 1"));
              },
              child: Icon(Icons.add)),
          ElevatedButton(
              onPressed: () {
                // context.watch<Counter>().addTodos(TaskModel("Title 1", "Task 1"));
                Provider.of<Counter>(context, listen: false).deleteTodos();
              },
              child: Icon(Icons.access_time)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: context.watch<Counter>().todos.isEmpty
                  ? Text("No Todos")
                  : Text(
                      "${context.watch<Counter>().todos.map((element) => "${element.title}")}"),
              // child: Provider.of<Counter>(context).todos.isEmpty ? Text("No Todos"): Text("2"),
            ),
          ],
        ),
      ),
    );
  }
}
