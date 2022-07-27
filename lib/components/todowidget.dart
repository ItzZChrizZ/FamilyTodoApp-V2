import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/database/provider.dart';
import 'package:familytodolistv2/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildTodo(context),
    );
  }

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () {},
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Checkbox(
                activeColor: Colors.blue,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);
                  Fluttertoast.showToast(
                      msg: isDone ? "Task Completed " : "Task Incomplete");
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: Constants.title,
                    ),
                    if (todo.description.isNotEmpty)
                      Container(
                        margin: const EdgeInsets.only(
                          top: 4.0,
                        ),
                        child:
                            Text(todo.description, style: Constants.subTitle),
                      ),
                  ],
                ),
              ),
              if (todo.selectedTime != null)
                Text("${todo.selectedTime}", style: Constants.subTitle),
            ],
          ),
        ),
      );
}
