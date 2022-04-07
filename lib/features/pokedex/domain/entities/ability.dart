import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';

// ignore: must_be_immutable
class Ability extends Equatable {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species? ability;
  bool? isHidden;
  int? slot;

  @override
  List<Object?> get props => [ability, isHidden, slot];
}
