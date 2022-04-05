import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/growth_rate.dart';

// ignore: must_be_immutable
class FlavorTextEntry extends Equatable {
  FlavorTextEntry({
    this.flavorText,
    this.language,
    this.version,
  });

  String? flavorText;
  GrowthRate? language;
  GrowthRate? version;

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json["flavor_text"],
        language: json["language"] == null
            ? null
            : GrowthRate.fromJson(json["language"]),
        version: json["version"] == null
            ? null
            : GrowthRate.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "flavor_text": flavorText,
        "language": language?.toJson(),
        "version": version?.toJson(),
      };

  @override
  List<Object?> get props => [flavorText, language, version];
}
