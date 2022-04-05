import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/generationI.dart';
import 'package:testing_ddd/features/pokedex/domain/models/generationII.dart';
import 'package:testing_ddd/features/pokedex/domain/models/generationIII.dart';
import 'package:testing_ddd/features/pokedex/domain/models/generationIV.dart';
import 'package:testing_ddd/features/pokedex/domain/models/generationV.dart';
import 'package:testing_ddd/features/pokedex/domain/models/generationVII.dart';
import 'package:testing_ddd/features/pokedex/domain/models/generationVIII.dart';
import 'package:testing_ddd/features/pokedex/domain/models/home_model.dart';

// ignore: must_be_immutable
class Versions extends Equatable {
  Versions({
    this.generationI,
    this.generationIi,
    this.generationIii,
    this.generationIv,
    this.generationV,
    this.generationVi,
    this.generationVii,
    this.generationViii,
  });

  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  Map<String, HomeModel>? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  factory Versions.fromJson(Map<String, dynamic> json) => Versions(
        generationI: GenerationI.fromJson(json["generation-i"]),
        generationIi: GenerationIi.fromJson(json["generation-ii"]),
        generationIii: GenerationIii.fromJson(json["generation-iii"]),
        generationIv: GenerationIv.fromJson(json["generation-iv"]),
        generationV: GenerationV.fromJson(json["generation-v"]),
        generationVi: Map.from(json["generation-vi"]).map(
            (k, v) => MapEntry<String, HomeModel>(k, HomeModel.fromJson(v))),
        generationVii: GenerationVii.fromJson(json["generation-vii"]),
        generationViii: GenerationViii.fromJson(json["generation-viii"]),
      );

  Map<String, dynamic> toJson() => {
        "generation-i": generationI?.toJson(),
        "generation-ii": generationIi?.toJson(),
        "generation-iii": generationIii?.toJson(),
        "generation-iv": generationIv?.toJson(),
        "generation-v": generationV?.toJson(),
        "generation-vi": generationVi != null
            ? Map.from(generationVi!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson()))
            : null,
        "generation-vii": generationVii?.toJson(),
        "generation-viii": generationViii?.toJson(),
      };

  @override
  List<Object?> get props => [
        generationI,
        generationIi,
        generationIii,
        generationIv,
        generationV,
        generationVi,
        generationVii,
        generationViii
      ];
}
