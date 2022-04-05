import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';
import 'package:testing_ddd/features/pokedex/domain/models/version_group_details.dart';

// ignore: must_be_immutable
class Move extends Equatable {
  Move({
    this.move,
    this.versionGroupDetails,
  });

  Species? move;
  List<VersionGroupDetail>? versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Species.fromJson(json["move"]),
        versionGroupDetails: json["version_group_details"] == null
            ? null
            : List<VersionGroupDetail>.from(json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move?.toJson(),
        "version_group_details": List<dynamic>.from(
            versionGroupDetails?.map((x) => x.toJson()) ?? []),
      };

  @override
  List<Object?> get props => [move, versionGroupDetails];
}
