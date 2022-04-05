import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/constants.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';

class PokedexTopContainer extends StatelessWidget {
  final PokedexPokemonModel selectedPokemon;

  /// Top exibition of a pokemon with GIF
  const PokedexTopContainer({Key? key, required this.selectedPokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Column(
            children: [
              Image.network(
                '${Constants.ANIMATED_SPRITE_URL}${selectedPokemon.name}.gif',
                height: 180,
                width: 180,
              ),
              Text(
                selectedPokemon.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
