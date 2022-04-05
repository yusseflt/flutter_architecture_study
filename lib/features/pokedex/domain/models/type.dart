import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';

// ignore: must_be_immutable
class TypeModel extends Equatable {
  TypeModel({
    this.slot,
    this.type,
  });

  int? slot;
  Species? type;

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json["slot"],
        type: json["type"] == null ? null : Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
      };

  @override
  List<Object?> get props => [slot, type];
}
