// ignore_for_file: file_names
import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/dreamworld.dart';
import 'package:testing_ddd/features/pokedex/domain/models/home_model.dart';

// ignore: must_be_immutable
class GenerationVii extends Equatable {
  GenerationVii({
    this.icons,
    this.ultraSunUltraMoon,
  });

  DreamWorld? icons;
  HomeModel? ultraSunUltraMoon;

  factory GenerationVii.fromJson(Map<String, dynamic> json) => GenerationVii(
        icons:
            json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
        ultraSunUltraMoon: json["ultra-sun-ultra-moon"] == null
            ? null
            : HomeModel.fromJson(json["ultra-sun-ultra-moon"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
        "ultra-sun-ultra-moon": ultraSunUltraMoon?.toJson(),
      };

  @override
  List<Object?> get props => [icons, ultraSunUltraMoon];
}
