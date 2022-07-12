// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/services/firebase.dart';
import 'package:flutter/material.dart';

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
                                docs![index]["title"],
                                style: Constants.title,
                              ),
                              Text(
                                docs[index]["Description"],
                                style: Constants.subTitle,
                              ),
                            ],
                          ),
                          Text(
                            docs[index]["Picked DateTime"],
                            style: Constants.regulerText,
                          ),
                        ],
                      ),
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
