import 'package:familytodolistv2/components/widgets/custombuttonrounded.dart';
import 'package:familytodolistv2/components/widgets/custominput.dart';
import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/database/provider.dart';
import 'package:familytodolistv2/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({Key? key}) : super(key: key);

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late DateTime date;
  final _formKey = GlobalKey<FormState>();

  pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    var newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return;
    setState(() {
      date = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.appBarColor,
          title: Text(
            "New Task",
            style: Constants.titleWhite,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CustomInput(
              controller: titleController,
              onPressed: () {},
              text: "Enter Title",
            ),
            CustomInput(
              controller: descriptionController,
              onPressed: () {},
              text: "Enter Description",
            ),
            CustomButtonRounded(
              text: "Select Time",
              onPressed: () {
                pickDate(context);
              },
            ),
            CustomButtonRounded(
              outlineBtn: false,
              onPressed: () {
                addTodo();
              },
              text: "Save Task",
            ),
          ],
        ),
      ),
    );
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
        id: DateTime.now().toString(),
        title: "$titleController",
        description: "$descriptionController",
        createdTime: DateTime.now(),
        selectedTime: date,
      );

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
