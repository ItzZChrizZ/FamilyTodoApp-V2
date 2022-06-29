import 'package:familytodolistv2/models/todo.dart';
import 'package:familytodolistv2/services/firebase.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Todo> todos = [];

  List<Todo> get todoss => todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      todos.where((todo) => todo.isDone == true).toList();

  void setTodos(List<Todo> todosf) =>
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        todos = todosf;
        notifyListeners();
      });

  void addTodo(Todo todo) => FireBaseApi.createTodo(todo);

  void deleteTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();

    return todo.isDone;
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
}
