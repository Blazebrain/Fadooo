import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/todo_service.dart';
import '../ui/add_todos/add_todo_view.dart';
import '../ui/home_view/home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: AddTodoView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TodoService),
  ],
)
class AppSetup {}
