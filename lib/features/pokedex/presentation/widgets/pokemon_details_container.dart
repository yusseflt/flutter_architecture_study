import 'package:flutter/material.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_details_model.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_species_model.dart';
import 'package:testing_ddd/features/pokedex/presentation/widgets/about_tab.dart';

class PokemonDetailsContainer extends StatefulWidget {
  final PokemonDetailsModel pokemonDetails;
  final PokemonSpeciesModel pokemonSpecies;
  const PokemonDetailsContainer({
    Key? key,
    required this.pokemonDetails,
    required this.pokemonSpecies,
  }) : super(key: key);

  @override
  State<PokemonDetailsContainer> createState() =>
      _PokemonDetailsContainerState();
}

class _PokemonDetailsContainerState extends State<PokemonDetailsContainer>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;
  late TabController controller;
  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  String getPokemonFlavorText(PokemonSpeciesModel pokemonSpecies) {
    return pokemonSpecies.flavorTextEntries!
        .firstWhere((element) => element.language!.name == "en")
        .flavorText!;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            TabBar(
              controller: controller,
              indicatorColor: Colors.white,
              labelPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              isScrollable: true,
              onTap: (page) {
                selectedPage = page;
                setState(() {});
              },
              tabs: const [
                Text("About"),
                Text("Moves"),
                Text("Sprites"),
              ],
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: IndexedStack(
                  index: selectedPage,
                  children: [
                    AboutTab(
                      stats: widget.pokemonDetails.stats,
                      weight: widget.pokemonDetails.weight! / 10,
                      height: widget.pokemonDetails.height! / 10,
                      description: getPokemonFlavorText(widget.pokemonSpecies),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
