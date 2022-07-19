import 'package:familytodolistv2/models/todo.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> todos = [];

  List<Todo> get todoss => todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  void updateTodo(
    Todo todo,
    String title,
    String description,
    DateTime selectedTime,
  ) {
    todo.title = title;
    todo.description = description;
    todo.selectedTime = selectedTime;

    notifyListeners();
  }

  void updateUser(
    UserInfo userinfo,
    String username,
    String password,
    String email,
    int number,
  ) {
    userinfo.userName = username;
    userinfo.passWord = password;
    userinfo.email = email;
    userinfo.number = number;
    notifyListeners();
  }
}
