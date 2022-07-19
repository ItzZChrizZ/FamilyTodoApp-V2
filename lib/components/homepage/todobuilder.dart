import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/models/todo.dart';
import 'package:flutter/material.dart';

class TodoBuilder extends StatelessWidget {
  final Todo todo;
  const TodoBuilder({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.amber,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  todo.title,
                  style: Constants.title,
                ),
                Text(
                  todo.description,
                  style: Constants.subTitle,
                ),
              ],
            ),
            Text(
              "${todo.selectedTime}",
              style: Constants.regulerText,
            ),
          ],
        ),
      ),
    );
  }
}
