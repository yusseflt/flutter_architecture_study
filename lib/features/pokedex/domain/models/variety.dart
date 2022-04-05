import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/growth_rate.dart';

// ignore: must_be_immutable
class Variety extends Equatable {
  Variety({
    this.isDefault,
    this.pokemon,
  });

  bool? isDefault;
  GrowthRate? pokemon;

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: json["pokemon"] == null
            ? null
            : GrowthRate.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
        "pokemon": pokemon?.toJson(),
      };

  @override
  List<Object?> get props => [isDefault, pokemon];
}
