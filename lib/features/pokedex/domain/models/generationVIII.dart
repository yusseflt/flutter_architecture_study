// ignore_for_file: file_names
import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/dreamworld.dart';

// ignore: must_be_immutable
class GenerationViii extends Equatable {
  GenerationViii({
    this.icons,
  });

  DreamWorld? icons;

  factory GenerationViii.fromJson(Map<String, dynamic> json) => GenerationViii(
        icons:
            json["icons"] == null ? null : DreamWorld.fromJson(json["icons"]),
      );

  Map<String, dynamic> toJson() => {
        "icons": icons?.toJson(),
      };

  @override
  List<Object?> get props => [icons];
}
