import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_example/state/root.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // Step 3: Create an instance of the model using .watch<T> which will rebuild the widget tree at every state change
    final counterModel = context.watch<Counter>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "${counterModel.count}", // Accessing the model's properties
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    counterModel.increment(); // Accessing the model's methods
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () {
                    counterModel.decrement();
                  },
                  child: Icon(Icons.menu),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
