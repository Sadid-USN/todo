import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _listTodo = [
    Todo(
        createdTime: DateTime.now(),
        title: 'Почитать книгу 📚',
        description: '''
      ● Изучаем Flutter стр:5
      ● Типы данных
      ● String, bool, int
      '''),
    Todo(
        createdTime: DateTime.now(),
        title: 'Занятся спортом 🏋️‍♂️',
        description: '''
      ● Отжимания 5 подходов
      ● пресидания 5 подходов
      ● прочитать 2 рката духа

 '''),
    Todo(
        createdTime: DateTime.now(),
        title: 'Занятся спортом 🏋️‍♂️',
        description: '''
      ● Отжимания 5 подходов
      ● пресидания 5 подходов
      ● прочитать 2 рката духа

 '''),
  ];

  //todo show todo
  List<Todo> get todos =>
      _listTodo.where((todo) => todo.isDone == false).toList();

  //todo COMPLITED todo
  List<Todo> get todosComplited =>
      _listTodo.where((todo) => todo.isDone == true).toList();

// todo ADD todo
  void addTodo(Todo todo) {
    _listTodo.add(todo);
    notifyListeners();
  }

  // todo UPDATE TODO
  void updateTodo(
    Todo todo,
    String titile,
    String description,
  ) {
    todo.title = titile;
    todo.description = description;
    notifyListeners();
  }

  //todo DELETE
  void removeTodo(Todo todo) {
    _listTodo.remove(todo);
    notifyListeners();
  }

  //todo  COMPLITED STATUS
  bool addToComlitedStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
}
