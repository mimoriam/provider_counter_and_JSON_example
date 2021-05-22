// To parse this JSON data, do
//
//     final jsonPlaceholder = jsonPlaceholderFromJson(jsonString);

import 'dart:convert';

JsonPlaceholder jsonPlaceholderFromJson(String str) => JsonPlaceholder.fromJson(json.decode(str));

String jsonPlaceholderToJson(JsonPlaceholder data) => json.encode(data.toJson());

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
