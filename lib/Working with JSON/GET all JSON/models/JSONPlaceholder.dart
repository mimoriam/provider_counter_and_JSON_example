// To parse this JSON data, do
//     final jsonPlaceholder = jsonPlaceholderFromJson(jsonString);

// Step 2: Make the model schema of the JSON:
import 'dart:convert';

List<JsonPlaceholder> jsonPlaceholderFromJson(String str) =>
    List<JsonPlaceholder>.from(json.decode(str).map((x) => JsonPlaceholder.fromJson(x)));

String jsonPlaceholderToJson(List<JsonPlaceholder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JsonPlaceholder {
  JsonPlaceholder({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory JsonPlaceholder.fromJson(Map<String, dynamic> json) => JsonPlaceholder(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
