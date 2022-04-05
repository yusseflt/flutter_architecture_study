import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/constants.dart';
import 'package:testing_ddd/core/util/text_helper.dart';
import 'package:testing_ddd/features/common/widgets/pikachu_loading.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_details_model.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_species_model.dart';
import 'package:testing_ddd/features/pokedex/presentation/bloc/pokemon_details_bloc.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/pokedex_details_app_bar.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/pokemon_details_container.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/pokemon_types_container.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage>
    with SingleTickerProviderStateMixin {
  PokemonDetailsBloc detailsBloc = PokemonDetailsBloc();
  late int pokemonId;
  late String pokemonName;
  bool firstTime = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;

    pokemonName = arguments["name"];
    pokemonId = arguments["id"];
    detailsBloc.fetchPokemonDetails(pokemonId);
    setState(() {});
  }

  String getPokemonGenera(PokemonSpeciesModel pokemonSpecies) {
    return pokemonSpecies.genera!
        .firstWhere((element) => element.language!.name == "en")
        .genus!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF090F0B),
        ),
        child: Stack(
          children: [
            for (var widget in backgroundImage()) widget,
            ListView(
              children: [
                PokedexDetailsAppBar(pokemonId: pokemonId),
                Image.network(
                  "${Constants.POKEMON_HOME_SPRITE_URL}$pokemonId.png",
                ),
                StreamBuilder(
                  stream: detailsBloc.stream,
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      PokemonDetailsModel pokemonDetails =
                          snapshot.data["pokemonDetails"];
                      PokemonSpeciesModel pokemonSpecies =
                          snapshot.data["pokemonSpecies"];

                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            name(),
                            const SizedBox(height: 16),
                            subtitle(pokemonSpecies),
                            const SizedBox(height: 16),
                            PokemonTypesContainer(
                              pokemonDetails: pokemonDetails,
                            ),
                            const SizedBox(height: 16),
                            PokemonDetailsContainer(
                              pokemonDetails: pokemonDetails,
                              pokemonSpecies: pokemonSpecies,
                            )
                          ],
                        ),
                      );
                    }
                    return const PikachuLoading();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget name() {
    return Text(
      TextHelper.upperFirstLetter(pokemonName),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget subtitle(PokemonSpeciesModel pokemonSpecies) {
    return Text(
      getPokemonGenera(pokemonSpecies),
      style: const TextStyle(
        color: Color(0xFFB8B6B3),
        fontSize: 16,
      ),
    );
  }

  List<Widget> backgroundImage() {
    return [
      Container(
        width: double.infinity,
        height: 500,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "${Constants.POKEMON_HOME_SPRITE_URL}$pokemonId.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    ];
  }
}
