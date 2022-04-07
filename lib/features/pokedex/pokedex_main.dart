import 'package:flutter/material.dart';
import 'package:testing_ddd/features/pokedex/application/pokedex_router.dart';

class Pokedex extends StatelessWidget {
  final GlobalKey<NavigatorState> parentNavigator;
  late final PokedexRouter router;

  Pokedex({Key? key, required this.parentNavigator}) : super(key: key) {
    router = PokedexRouter(parentNavigator: parentNavigator);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !Navigator.of(context).userGestureInProgress;
      },
      child: Navigator(
        key: router.navigatorKey,
        initialRoute: "pokedexPage",
        onGenerateRoute: router.onGenerateRoute,
        observers: [router],
      ),
    );
  }
}
