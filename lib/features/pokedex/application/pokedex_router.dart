import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/custom_router.dart';
import 'package:testing_ddd/features/pokedex/presentation/pages/pokedex_page.dart';
import 'package:testing_ddd/features/pokedex/presentation/pages/pokemon_details.dart';

class PokedexRouter extends CustomRouter {
  static final PokedexRouter _singleton = PokedexRouter._();
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  static late GlobalKey<NavigatorState> parentNavigatorKey;

  factory PokedexRouter({GlobalKey<NavigatorState>? parentNavigator}) {
    if (parentNavigator != null) {
      parentNavigatorKey = parentNavigator;
    }

    return _singleton;
  }

  PokedexRouter._();

  @override
  Map<String, Widget Function(BuildContext context)> get routes => {
        "pokedexPage": (context) => const PokedexPage(),
        "pokemonDetailsPage": (context) => const PokemonDetailsPage()
      };

  @override
  Route onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: routes[settings.name]!,
      settings: settings,
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  NavigatorState get parentNavigator => parentNavigatorKey.currentState!;

  @override
  NavigatorState get packageNavigator => _navigatorKey.currentState!;
}
