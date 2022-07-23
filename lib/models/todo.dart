import 'package:familytodolistv2/database/utils.dart';

class TodoField {
  static const createdTime = "Created Time";
}

class Todo {
  DateTime createdTime;
  String title;
  String description;
  String id;
  bool isDone;
  DateTime? selectedTime;

  Todo({
    required this.createdTime,
    required this.title,
    this.description = "",
    required this.id,
    this.isDone = false,
    this.selectedTime,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        createdTime: Utils.toDateTime(json["createdTime"]),
        id: json["id"],
        title: json["title"],
        description: json["description"],
        selectedTime: json["selectedTime"],
        isDone: json["isDone"],
      );

  Map<String, dynamic> toJson() => {
        "Created Time": Utils.fromDateTimeJson(createdTime),
        "title": title,
        "description": description,
        "selectedTime": selectedTime,
        "id": id,
        "isDone": isDone,
      };
}
