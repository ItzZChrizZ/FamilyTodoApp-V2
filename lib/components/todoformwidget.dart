import 'package:familytodolistv2/constants.dart';
import 'package:flutter/material.dart';

class TodoFormWidget extends StatefulWidget {
  final String? title;
  final String? description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final DateTime? selectedDate;
  final VoidCallback onSavedTodo;
  final ValueChanged<DateTime> onChangedSelectedTime;

  const TodoFormWidget({
    Key? key,
    this.title,
    this.description,
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
    this.selectedDate,
    required this.onChangedSelectedTime,
  }) : super(key: key);

  @override
  State<TodoFormWidget> createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
  DateTime? date;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildTitle(),
            const SizedBox(
              height: 10,
            ),
            buildDescription(),
            const SizedBox(
              height: 10,
            ),
            buildDateTimeText(),
            const SizedBox(
              height: 10,
            ),
            buildselectedDate(),
            const SizedBox(
              height: 10,
            ),
            buildSaveButton(),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      );

  buildTitle() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: TextFormField(
          maxLines: 1,
          initialValue: widget.title,
          onChanged: widget.onChangedTitle,
          validator: (title) {
            if (title!.isEmpty) {
              return "The title cannot be empty.";
            }
            return null;
          },
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: "Title",
            labelStyle: Constants.title,
          ),
        ),
      );

  buildDescription() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: TextFormField(
          maxLines: 3,
          onChanged: widget.onChangedDescription,
          initialValue: widget.description,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: "Description",
            labelStyle: Constants.regulerText,
          ),
        ),
      );

  buildSaveButton() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 18.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: 150.0,
          height: 45.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Constants.appBarColor),
            ),
            onPressed: widget.onSavedTodo,
            child: Text(
              "Save",
              style: Constants.titleWhite,
            ),
          ),
        ),
      );

  buildselectedDate() => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 18.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
          ),
          width: 150.0,
          height: 45.0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Constants.appBarColor),
            ),
            onPressed: () => pickDate(context),
            child: Text(
              "Select Date",
              style: Constants.titleWhite,
            ),
          ),
        ),
      );

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

  buildDateTimeText() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18.0,
        ),
        child: Text(
          getText(),
          style: Constants.subTitle,
        ),
      );

  String getText() {
    if (date == null) {
      return "Select a date";
    } else {
      return "${date!.day}/${date!.month}/${date?.year}";
    }
  }
}
