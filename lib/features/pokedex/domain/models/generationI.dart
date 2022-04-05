// ignore_for_file: file_names

import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/red_blue.dart';

// ignore: must_be_immutable
class GenerationI extends Equatable {
  GenerationI({
    this.redBlue,
    this.yellow,
  });

  RedBlue? redBlue;
  RedBlue? yellow;

  factory GenerationI.fromJson(Map<String, dynamic> json) => GenerationI(
        redBlue: json["red-blue"] == null
            ? null
            : RedBlue.fromJson(json["red-blue"]),
        yellow:
            json["yellow"] == null ? null : RedBlue.fromJson(json["yellow"]),
      );

  Map<String, dynamic> toJson() => {
        "red-blue": redBlue?.toJson(),
        "yellow": yellow?.toJson(),
      };

  @override
  List<Object?> get props => [redBlue, yellow];
}
