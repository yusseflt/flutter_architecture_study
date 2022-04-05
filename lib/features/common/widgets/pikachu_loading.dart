import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/pre_loader.dart';

class PikachuLoading extends StatefulWidget {
  const PikachuLoading({Key? key}) : super(key: key);

  @override
  State<PikachuLoading> createState() => _PikachuLoadingState();
}

class _PikachuLoadingState extends State<PikachuLoading> {
  late Timer timer;
  int dotsCount = 0;
  String loadingText = "Loading";

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      updateDotsCountAndUpdateView();
    });
    setState(() {});
  }

  void updateDotsCountAndUpdateView() {
    if (dotsCount == 3) {
      dotsCount = 0;
    }
    dotsCount++;
    String aux = "";
    for (var i = dotsCount; i > 0; i--) {
      aux += ".";
    }
    loadingText = "Loading $aux";
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    if (timer.isActive) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: PreLoader.loadingGif,
          width: 100,
        ),
        const SizedBox(height: 4),
        Text(
          loadingText,
          style: const TextStyle(
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
