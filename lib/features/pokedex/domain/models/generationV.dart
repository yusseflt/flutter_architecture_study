// ignore_for_file: file_names
import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/sprites.dart';

// ignore: must_be_immutable
class GenerationV extends Equatable {
  GenerationV({
    this.blackWhite,
  });

  Sprites? blackWhite;

  factory GenerationV.fromJson(Map<String, dynamic> json) => GenerationV(
        blackWhite: json["black-white"] == null
            ? null
            : Sprites.fromJson(json["black-white"]),
      );

  Map<String, dynamic> toJson() => {
        "black-white": blackWhite?.toJson(),
      };

  @override
  List<Object?> get props => [blackWhite];
}
