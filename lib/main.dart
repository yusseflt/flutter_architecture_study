import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/pre_loader.dart';
import 'package:testing_ddd/features/pokedex/application/pokedex_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> globalNavigatorKey =
      GlobalKey<NavigatorState>();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // init preloader
    PreLoader();
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Pokedex(parentNavigator: globalNavigatorKey),
    );
  }
}
