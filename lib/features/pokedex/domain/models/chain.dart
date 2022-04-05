import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/evolution_detail.dart';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';

// ignore: must_be_immutable
class Chain extends Equatable {
  Chain({
    this.evolutionDetails,
    this.evolvesTo,
    this.isBaby,
    this.species,
  });

  List<EvolutionDetail>? evolutionDetails;
  List<Chain>? evolvesTo;
  bool? isBaby;
  Species? species;

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        evolutionDetails: json["evolution_details"] == null
            ? null
            : List<EvolutionDetail>.from(json["evolution_details"]
                .map((x) => EvolutionDetail.fromJson(x))),
        evolvesTo: json["evolves_to"] == null
            ? null
            : List<Chain>.from(
                json["evolves_to"].map((x) => Chain.fromJson(x))),
        isBaby: json["is_baby"],
        species:
            json["species"] == null ? null : Species.fromJson(json["species"]),
      );

  Map<String, dynamic> toJson() => {
        "evolution_details": evolutionDetails == null
            ? null
            : List<dynamic>.from(evolutionDetails!.map((x) => x.toJson())),
        "evolves_to": evolvesTo == null
            ? null
            : List<dynamic>.from(evolvesTo!.map((x) => x.toJson())),
        "is_baby": isBaby,
        "species": species?.toJson(),
      };

  @override
  List<Object?> get props => [evolutionDetails, evolvesTo, isBaby, species];
}
