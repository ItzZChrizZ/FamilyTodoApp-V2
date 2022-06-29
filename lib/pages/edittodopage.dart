import 'package:familytodolistv2/components/todoformwidget.dart';
import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/database/provider.dart';
import 'package:familytodolistv2/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? description;

  DateTime? selectedTime;

  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
    selectedTime = widget.todo.selectedTime;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Todo",
            style: Constants.titleWhite,
          ),
          backgroundColor: Constants.appBarColor,
          actions: [
            IconButton(
              onPressed: () {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                provider.deleteTodo(widget.todo);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TodoFormWidget(
              selectedDate: selectedTime,
              title: title,
              description: description,
              onChangedTitle: (title) => setState(() {
                this.title = title;
              }),
              onChangedDescription: (description) => setState(() {
                this.description = description;
              }),
              onChangedSelectedTime: (date) => setState(() {
                selectedTime = date;
              }),
              onSavedTodo: saveTodo,
            ),
          ),
        ),
      );

  void saveTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(
        widget.todo,
        title!,
        description!,
        selectedTime!,
      );

      Navigator.pop(context);
    }
  }
}
