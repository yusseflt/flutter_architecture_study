import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/entities/ability.dart';
import 'package:testing_ddd/features/pokedex/domain/models/ability_model.dart';
import 'package:testing_ddd/features/pokedex/domain/models/game_index.dart';
import 'package:testing_ddd/features/pokedex/domain/models/move.dart';
import 'dart:convert';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';
import 'package:testing_ddd/features/pokedex/domain/models/sprites.dart';
import 'package:testing_ddd/features/pokedex/domain/models/stat.dart';
import 'package:testing_ddd/features/pokedex/domain/models/type.dart';

PokemonDetailsModel pokemonDetailsModelFromJson(String str) =>
    PokemonDetailsModel.fromJson(json.decode(str));

String pokemonDetailsModelToJson(PokemonDetailsModel data) =>
    json.encode(data.toJson());

// ignore: must_be_immutable
class PokemonDetailsModel extends Equatable {
  PokemonDetailsModel({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  List<Ability>? abilities;
  int? baseExperience;
  List<Species>? forms;
  List<GameIndex>? gameIndices;
  int? height;
  List<dynamic>? heldItems;
  int? id;
  bool? isDefault;
  String? locationAreaEncounters;
  List<Move>? moves;
  String? name;
  int? order;
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<TypeModel>? types;
  int? weight;

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        abilities: json["abilities"] == null
            ? null
            : List<Ability>.from(
                json["abilities"].map((x) => AbilityModel.fromJson(x))),
        baseExperience: json["base_experience"],
        forms: json["forms"] == null
            ? null
            : List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: json["game_indices"] == null
            ? null
            : List<GameIndex>.from(
                json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"],
        heldItems: json["held_items"] == null
            ? null
            : List<dynamic>.from(json["held_items"].map((x) => x)),
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        moves: json["moves"] == null
            ? null
            : List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        order: json["order"],
        pastTypes: json["past_types"] == null
            ? null
            : List<dynamic>.from(json["past_types"].map((x) => x)),
        species:
            json["species"] == null ? null : Species.fromJson(json["species"]),
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null
            ? null
            : List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: json["types"] == null
            ? null
            : List<TypeModel>.from(
                json["types"].map((x) => TypeModel.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(
            abilities?.map((x) => (x as AbilityModel).toJson()) ?? []),
        "base_experience": baseExperience,
        "forms": List<dynamic>.from(forms?.map((x) => x.toJson()) ?? []),
        "game_indices":
            List<dynamic>.from(gameIndices?.map((x) => x.toJson()) ?? []),
        "height": height,
        "held_items": List<dynamic>.from(heldItems?.map((x) => x) ?? []),
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "moves": List<dynamic>.from(moves?.map((x) => x.toJson()) ?? []),
        "name": name,
        "order": order,
        "past_types": List<dynamic>.from(pastTypes?.map((x) => x) ?? []),
        "species": species?.toJson(),
        "sprites": sprites?.toJson(),
        "stats": List<dynamic>.from(stats?.map((x) => x.toJson()) ?? []),
        "types": List<dynamic>.from(types?.map((x) => x.toJson()) ?? []),
        "weight": weight,
      };

  @override
  List<Object?> get props => [
        abilities,
        baseExperience,
        forms,
        gameIndices,
        height,
        heldItems,
        id,
        isDefault,
        locationAreaEncounters,
        moves,
        name,
        order,
        pastTypes,
        species,
        sprites,
        stats,
        types,
        weight,
      ];
}
