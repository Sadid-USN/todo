import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../main.dart';
import '../widget/add_todo_dialog.dart';
import '../widget/complited_list_widget.dart';
import '../widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnimateIconController _iconController = AnimateIconController();
  int selectedIndex = 0;
  // Box<String>? todoBox;

  // @override
  // void initState() {
  //   super.initState();
  //   todoBox = Hive.box<String>('todo');
  // }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const ComlitedListWidget(),
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          MyApp.title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.task_outlined,
              size: 30,
            ),
            label: 'Задача',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle_outline,
              size: 30,
            ),
            label: 'Завершенные',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        onPressed: () {},
        child: AnimateIcons(
          startIcon: Icons.add,
          endIcon: Icons.add,
          controller: _iconController,
          size: 30.0,
          onStartIconPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddTodoDialogWidget();
              },
              barrierDismissible: false,
            );

            return true;
          },
          onEndIconPress: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AddTodoDialogWidget();
              },
              barrierDismissible: false,
            );
            return true;
          },
          duration: const Duration(milliseconds: 500),
          startIconColor: Colors.white,
          endIconColor: Colors.white,
          clockwise: false,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: tabs[selectedIndex],
    );
  }
}
