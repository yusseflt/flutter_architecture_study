import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DreamWorld extends Equatable {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  String? frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };

  @override
  List<Object?> get props => [frontDefault, frontFemale];
}
