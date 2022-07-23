// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/todo.dart';

class FirebaseServices {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String? getUserId() {
    return _firebaseAuth.currentUser?.uid;
  }

  static Future<String> createTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection("Todos").doc();

    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());
    return docTodo.id;
  }
}
