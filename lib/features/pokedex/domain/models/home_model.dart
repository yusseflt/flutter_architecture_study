import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class HomeModel extends Equatable {
  HomeModel({
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };

  @override
  List<Object?> get props => [
        frontDefault,
        frontFemale,
        frontShiny,
        frontShinyFemale,
      ];
}
