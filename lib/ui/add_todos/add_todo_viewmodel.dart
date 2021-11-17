import 'package:faunadb_sample_project/app/app.locator.dart';
import 'package:faunadb_sample_project/app/app.router.dart';
import 'package:faunadb_sample_project/services/todo_service.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../todo.dart';

class AddTodoModel extends BaseViewModel {
  final service = locator<TodoService>();
  TodoRepository repo = TodoRepository();
  bool status = false;
  NavigationService navigationService = NavigationService();

  Future<void> createTodo(String name, String content) async {
    setBusy(true);
    Optional<String> uniqueId = await repo.nextId();
    String id = uniqueId.value;
    TodoModel newTodo = TodoModel(id, name, content, status, formatDate());
    final result = await service.saveTodo(newTodo);
    setBusy(false);
    navigateToHome();
  }

  String formatDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MMMM d' + ', ' + 'y').format(now);
    return formattedDate;
  }

  void navigateToHome() {
    navigationService.navigateTo(Routes.homeView);
  }
}
