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
        createdTime: Utils.toDateTime(
          json["createdTime"],
        ),
        title: json["title"],
        id: json["id"],
        selectedTime: json["selectedTime"],
      );

  Map<String, dynamic> toJson() => {
        "Created Time": Utils.fromDateTimeToJson(createdTime),
        "title": title,
        "description": description,
        "id": id,
        "isDone": isDone,
        "selectedTime": selectedTime,
      };
}
