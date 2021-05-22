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
  late Future<List<JsonPlaceholder>>
      futureJson; // Step 3: Create a late Future<<ListT>> variable from model

  @override
  void initState() {
    super.initState();
    futureJson = getJson(); // Step 5: Initialize that method in initState()
  }

  // Step 4: Add an async method (getJson()) to fetch data from the API:
  Future<List<JsonPlaceholder>> getJson() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      // List jsonResponse = json.decode(response.body);
      // return jsonResponse
      //     .map((data) => new JsonPlaceholder.fromJson(data))
      //     .toList();
      final jsonPlaceholder = jsonPlaceholderFromJson(response.body);
      return jsonPlaceholder;
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
          child: FutureBuilder<List<JsonPlaceholder>>(
              future: getJson(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<JsonPlaceholder>? data = snapshot.data;
                  return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text("${data[index].title}"),
                        );
                      });
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
