import 'package:familytodolistv2/components/todowidget.dart';
import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/database/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todoList = provider.todosNotCompeted;
    return todoList.isEmpty
        ? Center(
            child: Text(
              "No Todos",
              style: Constants.subTitle,
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            separatorBuilder: (context, index) => Container(
              height: 8.0,
            ),
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final todo = todoList[index];
              return TodoWidget(
                todo: todo,
              );
            },
          );
  }
}
