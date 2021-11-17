import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../services/todo_service.dart';

class HomeViewModel extends BaseViewModel {
  final _todoService = locator<TodoService>();
  final _navigationService = locator<NavigationService>();
  List<dynamic> todosList = [];

  Future<void> setUp() async {
    await runBusyFuture(getTodos());
  }

  Future<void> getTodos() async {
    todosList = await _todoService.getAllTodos();
  }

  Future<void> deleteTodo(String id) async {
    await _todoService.deleteTodo(id);
    todosList = await _todoService.getAllTodos();
    notifyListeners();
  }

  navigateToAddTodoPage() {
    _navigationService.navigateTo(Routes.addTodoView);
  }
}
