import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widget/todo_widget.dart';

import '../provider/todo_provider.dart';

class ComlitedListWidget extends StatelessWidget {
  const ComlitedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todos = provider.todosComplited;
    return todos.isEmpty
        ? const Center(
            child: Text(
              'Нет выполненных задач',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10.0),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(
                todo: todo,
              );
            },
          );
  }
}
