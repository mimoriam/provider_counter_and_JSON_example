import 'package:flutter/material.dart';
import 'package:provider_counter_example/screens/home_page.dart';

// Step 1: Create a class model with ChangeNotifier having all the properties and methods for state in it:
class Counter extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
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