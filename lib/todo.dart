import 'package:faunadb_data/faunadb_data.dart';

class TodoModel extends Entity<TodoModel> {
  final String id;
  final String todoName;
  final String todoContent;
  final bool completed;
  final String date;

  TodoModel(
    this.id,
    this.todoName,
    this.todoContent,
    this.completed,
    this.date,
  );

  @override
  TodoModel fromJson(Map<String, dynamic> model) {
    return TodoModel(
      model['id'] as String,
      model['todoName'] as String,
      model['todoContent'] as String,
      model['status'] as bool,
      model['date'] as String,
    );
  }

  @override
  String getId() {
    return id;
  }

  @override
  Map<String, dynamic> model() {
    Map<String, dynamic> model = {
      'id': id,
      'todoName': todoName,
      'todoContent': todoContent,
      'status': completed,
      'date': date,
    };

    return model;
  }

  static String collection() => "todos";

  static String allTodosIndex() => "all_todos";
}

TodoModel getTodoFromJson(Map<String, dynamic> json) {
  return TodoModel(
    json['id'] as String,
    json['todoName'] as String,
    json['todoContent'] as String,
    json['status'] as bool,
    json['date'] as String,
  );
}

class TodoRepository extends FaunaRepository<TodoModel> {
  TodoRepository() : super("todos", "all_todos");
}
