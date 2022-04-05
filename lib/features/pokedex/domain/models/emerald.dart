import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Emerald extends Equatable {
  Emerald({
    this.frontDefault,
    this.frontShiny,
  });

  String? frontDefault;
  String? frontShiny;

  factory Emerald.fromJson(Map<String, dynamic> json) => Emerald(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };

  @override
  List<Object?> get props => [frontDefault, frontShiny];
}
