// To parse this JSON data, do
//
//     final pokemonSpeciesModel = pokemonSpeciesModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/evolution_chain.dart';
import 'package:testing_ddd/features/pokedex/domain/models/flavor_text_entry.dart';
import 'package:testing_ddd/features/pokedex/domain/models/genus.dart';
import 'package:testing_ddd/features/pokedex/domain/models/growth_rate.dart';
import 'package:testing_ddd/features/pokedex/domain/models/variety.dart';

PokemonSpeciesModel pokemonSpeciesModelFromJson(String str) =>
    PokemonSpeciesModel.fromJson(json.decode(str));

String pokemonSpeciesModelToJson(PokemonSpeciesModel data) =>
    json.encode(data.toJson());

// ignore: must_be_immutable
class PokemonSpeciesModel extends Equatable {
  PokemonSpeciesModel({
    this.baseHappiness,
    this.captureRate,
    this.eggGroups,
    this.evolutionChain,
    this.flavorTextEntries,
    this.genera,
    this.growthRate,
    this.hatchCounter,
    this.id,
    this.isBaby,
    this.isLegendary,
    this.isMythical,
    this.name,
    this.shape,
    this.varieties,
  });

  int? baseHappiness;
  int? captureRate;
  List<GrowthRate>? eggGroups;
  EvolutionChain? evolutionChain;
  List<FlavorTextEntry>? flavorTextEntries;
  List<Genus>? genera;
  GrowthRate? growthRate;
  int? hatchCounter;
  int? id;
  bool? isBaby;
  bool? isLegendary;
  bool? isMythical;
  String? name;
  GrowthRate? shape;
  List<Variety>? varieties;

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =>
      PokemonSpeciesModel(
        baseHappiness: json["base_happiness"],
        captureRate: json["capture_rate"],
        eggGroups: json["egg_groups"] == null
            ? null
            : List<GrowthRate>.from(
                json["egg_groups"].map((x) => GrowthRate.fromJson(x))),
        evolutionChain: json["evolution_chain"] == null
            ? null
            : EvolutionChain.fromJson(json["evolution_chain"]),
        flavorTextEntries: json["flavor_text_entries"] == null
            ? null
            : List<FlavorTextEntry>.from(json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        genera: json["genera"] == null
            ? null
            : List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        growthRate: json["growth_rate"] == null
            ? null
            : GrowthRate.fromJson(json["growth_rate"]),
        hatchCounter: json["hatch_counter"],
        id: json["id"],
        isBaby: json["is_baby"],
        isLegendary: json["is_legendary"],
        isMythical: json["is_mythical"],
        name: json["name"],
        shape:
            json["shape"] == null ? null : GrowthRate.fromJson(json["shape"]),
        varieties: json["varieties"] == null
            ? null
            : List<Variety>.from(
                json["varieties"].map((x) => Variety.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness,
        "capture_rate": captureRate,
        "egg_groups": eggGroups == null
            ? null
            : List<dynamic>.from(eggGroups!.map((x) => x.toJson())),
        "evolution_chain": evolutionChain?.toJson(),
        "flavor_text_entries": flavorTextEntries == null
            ? null
            : List<dynamic>.from(flavorTextEntries!.map((x) => x.toJson())),
        "genera": genera == null
            ? null
            : List<dynamic>.from(genera!.map((x) => x.toJson())),
        "growth_rate": growthRate?.toJson(),
        "hatch_counter": hatchCounter,
        "id": id,
        "is_baby": isBaby,
        "is_legendary": isLegendary,
        "is_mythical": isMythical,
        "name": name,
        "shape": shape?.toJson(),
        "varieties": varieties == null
            ? null
            : List<dynamic>.from(varieties!.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [
        baseHappiness,
        captureRate,
        eggGroups,
        evolutionChain,
        flavorTextEntries,
        genera,
        growthRate,
        hatchCounter,
        id,
        isBaby,
        isLegendary,
        isMythical,
        name,
        shape,
        varieties
      ];
}
