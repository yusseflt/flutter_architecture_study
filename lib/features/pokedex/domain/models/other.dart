import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/dreamworld.dart';
import 'package:testing_ddd/features/pokedex/domain/models/home_model.dart';
import 'package:testing_ddd/features/pokedex/domain/models/official_artwork.dart';

// ignore: must_be_immutable
class Other extends Equatable {
  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
  });

  DreamWorld? dreamWorld;
  HomeModel? home;
  OfficialArtwork? officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null
            ? null
            : DreamWorld.fromJson(json["dream_world"]),
        home: json["home"] == null ? null : HomeModel.fromJson(json["home"]),
        officialArtwork: json["official-artwork"] == null
            ? null
            : OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "dream_world": dreamWorld?.toJson(),
        "home": home?.toJson(),
        "official-artwork": officialArtwork?.toJson(),
      };

  @override
  List<Object?> get props => [dreamWorld, home, officialArtwork];
}
