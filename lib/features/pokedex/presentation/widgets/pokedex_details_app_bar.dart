import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/text_helper.dart';
import 'package:testing_ddd/features/pokedex/application/pokedex_router.dart';

class PokedexDetailsAppBar extends StatelessWidget {
  final int pokemonId;
  const PokedexDetailsAppBar({Key? key, required this.pokemonId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              PokedexRouter().packageNavigator.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          Text(
            '#${TextHelper.padNumberLeft(pokemonId)}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle_outline_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
