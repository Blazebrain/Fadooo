// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/add_todos/add_todo_view.dart';
import '../ui/home_view/home_view.dart';

class Routes {
  static const String addTodoView = '/add-todo-view';
  static const String homeView = '/home-view';
  static const all = <String>{
    addTodoView,
    homeView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.addTodoView, page: AddTodoView),
    RouteDef(Routes.homeView, page: HomeView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    AddTodoView: (data) {
      var args = data.getArgs<AddTodoViewArguments>(
        orElse: () => AddTodoViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddTodoView(key: args.key),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddTodoView arguments holder class
class AddTodoViewArguments {
  final Key? key;
  AddTodoViewArguments({this.key});
}
