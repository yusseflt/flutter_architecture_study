import 'package:flutter/material.dart';
import 'package:testing_ddd/core/util/color_helper.dart';
import 'package:testing_ddd/core/util/text_helper.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_details_model.dart';

class PokemonTypesContainer extends StatelessWidget {
  final PokemonDetailsModel pokemonDetails;
  const PokemonTypesContainer({
    Key? key,
    required this.pokemonDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pokemonDetails.types!.map<Widget>((type) {
        String typeName = type.type!.name!;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: ColorHelper.getTypeColor(
                typeName,
              )!,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Text(
            TextHelper.upperFirstLetter(typeName),
            style: TextStyle(
              color: ColorHelper.getTypeColor(
                typeName,
              )!,
            ),
          ),
        );
      }).toList(),
    );
  }
}
