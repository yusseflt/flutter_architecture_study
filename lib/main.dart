import 'package:flutter/material.dart';
import 'package:testing_ddd/core/application/application_manager.dart';
import 'package:testing_ddd/features/common/pages/splash_screen.dart';

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
    ApplicationManager(applicationNavigator: globalNavigatorKey);
    return MaterialApp(
      navigatorKey: globalNavigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
