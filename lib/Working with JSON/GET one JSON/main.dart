import 'package:flutter/material.dart';

// Step 1: Import the necessary model & package:
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/JSONPlaceholder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<JsonPlaceholder> futureJson; // Step 3: Create a late Future<T> variable from model

  @override
  void initState() {
    super.initState();
    futureJson = getJson(); // Step 5: Initialize that method in initState()
  }

  // Step 4: Add an async method (getJson()) to fetch data from the API:
  Future<JsonPlaceholder> getJson() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      return jsonPlaceholderFromJson(response.body);
    } else {
      throw Exception("Failed to load!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          // Step 6: Display that data using a FutureBuilder of type (Model):
          child: FutureBuilder<JsonPlaceholder>(
              future: futureJson,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data!.title}");
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
