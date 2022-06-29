import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/database/provider.dart';
import 'package:familytodolistv2/main.dart';
import 'package:familytodolistv2/models/todo.dart';
import 'package:familytodolistv2/pages/completedtodolistpage.dart';
import 'package:familytodolistv2/pages/todolistpage.dart';
import 'package:familytodolistv2/pages/todopage.dart';
import 'package:familytodolistv2/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListPage(),
      const CompletedTodoListPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.appBarColor,
        centerTitle: true,
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Constants.navBarColor,
        unselectedItemColor: Constants.iconColors.withOpacity(0.7),
        selectedItemColor: Constants.iconColors,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fact_check_outlined,
            ),
            label: "Todos",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.done,
              size: 28.0,
            ),
            label: "Competed Todos",
          ),
        ],
      ),
      body: StreamBuilder<List<Todo>>(
          stream: FireBaseApi.readTodos(),
          builder: (context, snapshot) {
            final todos = snapshot.data;
            final provider = Provider.of<TodosProvider>(context);
            provider.setTodos(todos!);
            return tabs[selectedIndex];
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: Constants.navBarColor,
        child: Icon(
          Icons.add,
          color: Constants.iconColors,
          size: 36,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TodoPage(),
          ),
        ),
      ),
    );
  }
}
