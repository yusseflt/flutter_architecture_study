import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/constants.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';

class PokemonCard extends StatefulWidget {
  final PokedexPokemonModel pokedexPokemonModel;
  final int index;
  final void Function(int, String) selectPokemon;

  /// Item from pokemon scrollable list

  const PokemonCard({
    Key? key,
    required this.pokedexPokemonModel,
    required this.index,
    required this.selectPokemon,
  }) : super(key: key);

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  late PokedexPokemonModel pokemon;

  @override
  void initState() {
    super.initState();
    pokemon = widget.pokedexPokemonModel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () => widget.selectPokemon(widget.index, pokemon.name),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "${Constants.GEN_VII_ICON}${widget.index + 1}.png",
                height: 40,
                width: 40,
                errorBuilder: (context, _, __) => Image.network(
                  "${Constants.GEN_VIII_ICON}${widget.index + 1}.png",
                  height: 40,
                  width: 40,
                ),
              ),
              Text(pokemon.name),
            ],
          ),
        ),
      ),
    );
  }
}
