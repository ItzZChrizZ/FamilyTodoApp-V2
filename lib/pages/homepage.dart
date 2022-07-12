import 'package:familytodolistv2/components/homepage/competedtodolistpage.dart';
import 'package:familytodolistv2/components/homepage/todolistpage.dart';
import 'package:familytodolistv2/constants.dart';
import 'package:familytodolistv2/main.dart';
import 'package:familytodolistv2/pages/createtodopage.dart';
import 'package:flutter/material.dart';

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
        centerTitle: true,
        backgroundColor: Constants.appBarColor,
        title: Text(
          MyApp.title,
        ),
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
      body: tabs[selectedIndex],
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
            builder: (context) => const CreateTodoPage(),
          ),
        ),
      ),
    );
  }
}
