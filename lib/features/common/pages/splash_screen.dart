import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testing_ddd/core/application/application_manager.dart';
import 'package:testing_ddd/core/util/pre_loader.dart';
import 'package:testing_ddd/features/common/widgets/pikachu_loading.dart';
import 'package:testing_ddd/features/pokedex/pokedex_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animationController.forward();
    // init preloader

    Timer(Duration(seconds: 2), () async {
      await PreLoader.init();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Pokedex(
              parentNavigator: ApplicationManager.applicationNavigatorKey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF090F0B),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PikachuLoading(),
          ],
        ),
      ),
    );
  }
}
