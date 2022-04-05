import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:testing_ddd/features/pokedex/application/pokedex_router.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';
import 'package:testing_ddd/features/pokedex/presentation/bloc/pokedex_bloc.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/pokemon_card.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({Key? key}) : super(key: key);

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  PokedexBloc pokedexBloc = PokedexBloc();
  @override
  void initState() {
    super.initState();
    pokedexBloc.pagingController.addPageRequestListener((pageKey) {
      pokedexBloc.fetchPokedex(next: true);
    });
  }

  void navigateToDetailsPage(int index, String pokemonName) {
    PokedexRouter().packageNavigator.pushNamed(
      "pokemonDetailsPage",
      arguments: {
        "id": index + 1,
        "name": pokemonName,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedGridView<int, PokedexPokemonModel>(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 80,
        ),
        pagingController: pokedexBloc.pagingController,
        builderDelegate: PagedChildBuilderDelegate<PokedexPokemonModel>(
          itemBuilder: (context, pokemon, index) => PokemonCard(
            pokedexPokemonModel: pokemon,
            index: index,
            selectPokemon: navigateToDetailsPage,
          ),
        ),
      ),
    );
  }
}
