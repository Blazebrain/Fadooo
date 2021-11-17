// ignore_for_file: implementation_imports

import 'package:faunadb_data/faunadb_data.dart';
import 'package:faunadb_sample_project/ui/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setCurrentUserDbKey("fnAEYN64NRACTPDn3gR0FEclMFQHi72GJpbvW0ym");
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const HomeView(),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
