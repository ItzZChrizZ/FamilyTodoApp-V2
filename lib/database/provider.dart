import 'package:familytodolistv2/models/todo.dart';
import 'package:familytodolistv2/services/firebase.dart';
import 'package:flutter/material.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todosNotCompeted =>
      _todos.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void setTodos(List<Todo> todos) =>
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        _todos = todos;
        notifyListeners();
      });

  void addTodo(Todo todo) => FirebaseServices.createTodo(todo);

  void deleteTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    FirebaseServices.updateTodo(todo);

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

    FirebaseServices.updateTodo(todo);
    notifyListeners();
  }
}
