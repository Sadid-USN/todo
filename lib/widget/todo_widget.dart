import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:provider/provider.dart';
import 'package:todo/helper/show_snackbar.dart';

import 'package:todo/provider/todo_provider.dart';

import '../model/todo_model.dart';
import '../screens/edit_todo_page.dart';

class TodoWidget extends StatelessWidget {
  final Todo? todo;
  const TodoWidget({Key? key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => editTodo(context, todo!)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Slidable(
          key: Key(todo!.id),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  editTodo(context, todo!);
                },
                backgroundColor: Colors.green.withOpacity(0.6),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Изменить',
              ),
            ],
          ),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  deleteTodo(context, todo!);
                },
                backgroundColor: Colors.red.withOpacity(0.8),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Удалить',
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            //height: 200,
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              color: Color(0xffF3EEE2),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0)
              ],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: Theme.of(context).primaryColor,
                  checkColor: Colors.white,
                  value: todo!.isDone,
                  onChanged: (_) {
                    complitedTodo(context);
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo!.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.blueGrey.shade700,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (todo!.description.isNotEmpty)
                      Container(
                        // margin: const EdgeInsets.only(top: 5),
                        child: Text(
                          todo!.description,
                          style: TextStyle(
                            color: Colors.grey.shade900,
                            fontSize: 16,
                          ),
                        ),
                      ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    provider.removeTodo(todo);

    ShowDeleteSnackbar.showSnackbar(context, "Задача удалена 🗑️");
  }

  bool complitedTodo(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context, listen: false);
    final bool isDone = provider.addToComlitedStatus(todo!);
    ShowCompliteSnackbar.showSnackbar(context,
        isDone ? 'Отлично! Вы завершили задачу ✔️' : 'Вы вернули задачу ↩️');
    return isDone;
  }

  void editTodo(BuildContext context, Todo todo) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EditTodoPage(todo: todo);
    }));
  }
}
