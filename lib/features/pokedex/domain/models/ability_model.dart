import 'package:testing_ddd/features/pokedex/domain/entities/ability.dart';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';

// ignore: must_be_immutable
class AbilityModel extends Ability {
  AbilityModel({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) : super(ability: ability, isHidden: isHidden, slot: slot);

  factory AbilityModel.fromJson(Map<String, dynamic> json) => AbilityModel(
        ability:
            json["ability"] == null ? null : Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability?.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}
