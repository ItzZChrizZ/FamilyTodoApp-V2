import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytodolistv2/database/utils.dart';
import 'package:familytodolistv2/models/todo.dart';

class FireBaseApi {
  static Future<String> createTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection("todo").doc();

    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());

    return docTodo.id;
  }

  static Stream<List<Todo>> readTodos() => FirebaseFirestore.instance
      .collection("todo")
      .orderBy(TodoField.createdTime, descending: true)
      .snapshots()
      .transform(Utils.transformer(Todo.fromJson).cast());
}
