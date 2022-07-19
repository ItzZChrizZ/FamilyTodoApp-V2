import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytodolistv2/components/widgets/custombuttonrounded.dart';
import 'package:familytodolistv2/components/widgets/custominput.dart';
import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({Key? key}) : super(key: key);

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late DateTime date;

  addtasktoFirebase() async {
    final FirebaseServices _firebaseServices = FirebaseServices();
    final uid = _firebaseServices.getUserId();
    var time = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    await FirebaseFirestore.instance
        .collection("Tasks")
        .doc(uid)
        .collection("Mytasks")
        .doc(time.toString())
        .set({
      "title": titleController.text,
      "Description": descriptionController.text,
      "Picked DateTime": formattedDate,
      "Time": time.toString()
    });
    Fluttertoast.showToast(msg: "Task Added");
  }

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
    return Scaffold(
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
            onPressed: (){},
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
              addtasktoFirebase();
              Navigator.pop(context);
            },
            text: "Save Task",
          ),
        ],
      ),
    );
  }
}
