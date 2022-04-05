import 'package:flutter/cupertino.dart';

class PreLoader {
  static final PreLoader _instance = PreLoader._();
  PreLoader._();

  static bool initiated = false;
  static late ImageProvider loadingGif;

  factory PreLoader() {
    if (!initiated) {
      initiated = true;
      loadingGif = const AssetImage("assets/gif/pikachu_loading.gif");
    }

    return _instance;
  }
}
