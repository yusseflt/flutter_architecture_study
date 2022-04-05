// ignore_for_file: file_names
import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/crystal.dart';
import 'package:testing_ddd/features/pokedex/domain/models/gold.dart';

// ignore: must_be_immutable
class GenerationIi extends Equatable {
  GenerationIi({
    this.crystal,
    this.gold,
    this.silver,
  });

  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  factory GenerationIi.fromJson(Map<String, dynamic> json) => GenerationIi(
        crystal:
            json["crystal"] == null ? null : Crystal.fromJson(json["crystal"]),
        gold: json["gold"] == null ? null : Gold.fromJson(json["gold"]),
        silver: json["silver"] == null ? null : Gold.fromJson(json["silver"]),
      );

  Map<String, dynamic> toJson() => {
        "crystal": crystal?.toJson(),
        "gold": gold?.toJson(),
        "silver": silver?.toJson(),
      };

  @override
  List<Object?> get props => [crystal, gold, silver];
}
