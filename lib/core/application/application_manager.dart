import 'package:flutter/material.dart';

class ApplicationManager {
  static final ApplicationManager _singleton = ApplicationManager._();
  static late GlobalKey<NavigatorState> applicationNavigatorKey;

  ApplicationManager._();

  factory ApplicationManager(
      {GlobalKey<NavigatorState>? applicationNavigator}) {
    if (applicationNavigator != null) {
      applicationNavigatorKey = applicationNavigator;
    }

    return _singleton;
  }
}
