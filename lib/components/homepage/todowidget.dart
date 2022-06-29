import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/database/provider.dart';
import 'package:familytodolistv2/database/utils.dart';
import 'package:familytodolistv2/models/todo.dart';
import 'package:familytodolistv2/pages/edittodopage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;

  const TodoWidget({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            dismissible: DismissiblePane(onDismissed: () {}),
            children: [
              SlidableAction(
                onPressed: (context) => editTodo(context, todo),
                backgroundColor: Colors.green,
                icon: Icons.edit,
                label: "Edit",
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: ((context) => deleteTodo(context, todo)),
                backgroundColor: Colors.red,
                icon: Icons.delete,
                label: "delete",
              ),
            ],
          ),
          key: Key(todo.id),
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(
        onTap: () => editTodo(context, todo),
        child: Container(
          decoration: BoxDecoration(
            color: Constants.backgroundColor,
          ),
          padding: const EdgeInsets.all(
            20.0,
          ),
          child: Row(
            children: [
              Checkbox(
                activeColor: Constants.checkBoxColor,
                checkColor: Constants.backgroundColor,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);

                  Utils.showSnackbar(context,
                      isDone ? "Task compeleted" : "Task marked incomplete");
                },
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
                        child: Text(
                          todo.description,
                          style: Constants.subTitle,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                "${todo.selectedTime}",
                style: Constants.regulerText,
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.deleteTodo(todo);
    Utils.showSnackbar(
      context,
      "Deleted the Task",
    );
  }

  editTodo(BuildContext context, Todo todo) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditTodoPage(
          todo: todo,
        ),
      ));
}
