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
}

class UserInfo {
  String userName;
  String passWord;
  String email;
  int number;
  int userId;

  UserInfo({
    required this.userName,
    required this.passWord,
    required this.email,
    required this.number,
    required this.userId,
  });
}
