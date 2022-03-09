import 'package:flutter/material.dart';

class TodoFormWidget extends StatefulWidget {
  final String title;
  final String description;
  final ValueChanged<String>? onChangedTitle;
  final ValueChanged<String>? onChangedDescription;
  final VoidCallback? onSavedTodo;

  const TodoFormWidget(
      {Key? key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo})
      : super(key: key);

  @override
  State<TodoFormWidget> createState() => _TodoFormWidgetState();
}

class _TodoFormWidgetState extends State<TodoFormWidget> {
//  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitile(),
        const SizedBox(
          height: 8.0,
        ),
        buildDescription(),
        const SizedBox(
          height: 8.0,
        ),
        buildButton(),
      ],
    ));
  }

  Widget buildTitile() {
    return TextFormField(
      maxLines: 1,
      onChanged: widget.onChangedTitle,
      initialValue: widget.title,
      validator: (title) {
        if (title!.isEmpty) {
          return 'Заголовок не может быть пустым';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Заголовок',
      ),
    );
  }

  Widget buildDescription() {
    return TextFormField(
      maxLines: 2,
      onChanged: widget.onChangedDescription,
      initialValue: widget.description,
      validator: (description) {
        if (description!.isEmpty) {
          return 'Пожалуйста добавьте описание';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Описание',
      ),
    );
  }

  Widget buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onSavedTodo,
        child: const Text(
          'Сохранить',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
