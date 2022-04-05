import 'package:flutter/material.dart';

abstract class CustomRouter extends RouteObserver<MaterialPageRoute<dynamic>> {
  /// Navigator Key to be passed to the [Navigator] Widget

  GlobalKey<NavigatorState> get navigatorKey;

  /// The Package Navigator
  ///
  /// Used for navigating through pages from the selected package
  ///
  /// The class must have a not empty [GlobalKey] of [NavigatorState] to return
  NavigatorState get packageNavigator;

  /// The Parent Navigator
  ///
  /// Used for navigating through packages
  ///
  /// Should be received from the class Constructor from parent navigator

  NavigatorState get parentNavigator;

  /// A map routes available to navigate inside the package

  Map<String, Widget Function(BuildContext context)> get routes;

  /// Generate the navigation to page
  ///
  Route<dynamic> onGenerateRoute(RouteSettings settings);
}
