import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/growth_rate.dart';

// ignore: must_be_immutable
class Genus extends Equatable {
  Genus({
    this.genus,
    this.language,
  });

  String? genus;
  GrowthRate? language;

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: json["language"] == null
            ? null
            : GrowthRate.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "language": language?.toJson(),
      };

  @override
  List<Object?> get props => [genus, language];
}
