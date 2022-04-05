import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class OfficialArtwork extends Equatable {
  OfficialArtwork({
    this.frontDefault,
  });

  String? frontDefault;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
      };

  @override
  List<Object?> get props => [frontDefault];
}
