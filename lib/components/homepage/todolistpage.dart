// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  String? uid = "";
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  void initState() {
    uid = _firebaseServices.getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Tasks")
              .doc(uid)
              .collection("Mytasks")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final docs = snapshot.data?.docs;
              return ListView.builder(
                itemCount: docs?.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(
                      10.0,
                    ),
                    padding: const EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (_) {},
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                docs![index]["title"],
                                style: Constants.title,
                              ),
                              Text(
                                docs[index]["Description"],
                                style: Constants.title,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          docs[index]["Picked DateTime"],
                          style: Constants.title,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
