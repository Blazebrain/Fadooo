import 'package:faunadb_data/faunadb_data.dart';
import 'package:optional/optional.dart';

import '../todo.dart';

class TodoService {
  TodoRepository todoRepository = TodoRepository();

  //CRUD Operations in Fauna

  /// Create Operation
  saveTodo(TodoModel todo) async {
    await todoRepository.save(todo, getTodoFromJson);
  }

  /// Read Operation 1
  Future<List> getAllTodos() async {
    PaginationOptions po = PaginationOptions(size: Optional.of(20));
    final result = await todoRepository.findAll(po, getTodoFromJson);
    return result.data;
  }

  /// Read Operation 2
  Future<TodoModel> getSingleTodo(String id) async {
    final result = await todoRepository.find(id, getTodoFromJson);
    return result.value;
  }

  /// Update Operation
  updateTodo(TodoModel todo) async {
    await todoRepository.save(todo, getTodoFromJson);
  }

  /// Delete Operation
  deleteTodo(String id) async {
    final result = await todoRepository.remove(id, getTodoFromJson);
    return result.value;
  }
}
