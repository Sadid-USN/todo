import 'package:hive/hive.dart';

part 'hive_save_todo.g.dart';

@HiveType(typeId: 1)
class HiveSaveTodo {
  HiveSaveTodo({required this.title, required this.description});
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;
}
