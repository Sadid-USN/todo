import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'package:todo/provider/todo_provider.dart';
import 'package:todo/screens/home_page.dart';

late Box box;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory ducument = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.init(ducument.path);
  await Hive.openBox<String>('todo');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'Задачи';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Gilroy',
        ),
        home: const HomePage(),
      ),
    );
  }
}
