import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter_example/state/root.dart';

// https://www.youtube.com/watch?v=NeAMD0lQ5jw
void main() {
  // Step 2: Instantiate the model via a MultiProvider at the root of the app:
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => Counter()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Root(),
    );
  }
}