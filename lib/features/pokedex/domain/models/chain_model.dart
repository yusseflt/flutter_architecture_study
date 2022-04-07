import 'package:testing_ddd/features/pokedex/domain/entities/chain.dart';
import 'package:testing_ddd/features/pokedex/domain/models/evolution_detail.dart';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';

// ignore: must_be_immutable
class ChainModel extends Chain {
  ChainModel({
    List<EvolutionDetail>? evolutionDetails,
    List<Chain>? evolvesTo,
    bool? isBaby,
    Species? species,
  }) : super(
          evolutionDetails: evolutionDetails,
          evolvesTo: evolvesTo,
          isBaby: isBaby,
          species: species,
        );

  factory ChainModel.fromJson(Map<String, dynamic> json) => ChainModel(
        evolutionDetails: json["evolution_details"] == null
            ? null
            : List<EvolutionDetail>.from(
                json["evolution_details"].map(
                  (x) => EvolutionDetail.fromJson(x),
                ),
              ),
        evolvesTo: json["evolves_to"] == null
            ? null
            : List<ChainModel>.from(
                json["evolves_to"].map(
                  (x) => ChainModel.fromJson(x),
                ),
              ),
        isBaby: json["is_baby"],
        species:
            json["species"] == null ? null : Species.fromJson(json["species"]),
      );

  Map<String, dynamic> toJson() => {
        "evolution_details": evolutionDetails == null
            ? null
            : List<dynamic>.from(
                evolutionDetails!.map(
                  (x) => x.toJson(),
                ),
              ),
        "evolves_to": evolvesTo == null
            ? null
            : List<dynamic>.from(
                evolvesTo!.map(
                  (x) => (x as ChainModel).toJson(),
                ),
              ),
        "is_baby": isBaby,
        "species": species?.toJson(),
      };
}
