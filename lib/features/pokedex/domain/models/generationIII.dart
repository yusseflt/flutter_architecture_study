// ignore_for_file: file_names
import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/emerald.dart';
import 'package:testing_ddd/features/pokedex/domain/models/gold.dart';

// ignore: must_be_immutable
class GenerationIii extends Equatable {
  GenerationIii({
    this.emerald,
    this.fireredLeafgreen,
    this.rubySapphire,
  });

  Emerald? emerald;
  Gold? fireredLeafgreen;
  Gold? rubySapphire;

  factory GenerationIii.fromJson(Map<String, dynamic> json) => GenerationIii(
        emerald:
            json["emerald"] == null ? null : Emerald.fromJson(json["emerald"]),
        fireredLeafgreen: json["firered-leafgreen"] == null
            ? null
            : Gold.fromJson(json["firered-leafgreen"]),
        rubySapphire: json["ruby-sapphire"] == null
            ? null
            : Gold.fromJson(json["ruby-sapphire"]),
      );

  Map<String, dynamic> toJson() => {
        "emerald": emerald?.toJson(),
        "firered-leafgreen": fireredLeafgreen?.toJson(),
        "ruby-sapphire": rubySapphire?.toJson(),
      };

  @override
  List<Object?> get props => [emerald, fireredLeafgreen, rubySapphire];
}
