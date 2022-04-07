import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/evolution_detail.dart';
import 'package:testing_ddd/features/pokedex/domain/models/species.dart';

// ignore: must_be_immutable
class Chain extends Equatable {
  Chain({
    this.evolutionDetails,
    this.evolvesTo,
    this.isBaby,
    this.species,
  });

  List<EvolutionDetail>? evolutionDetails;
  List<Chain>? evolvesTo;
  bool? isBaby;
  Species? species;

  @override
  List<Object?> get props => [evolutionDetails, evolvesTo, isBaby, species];
}
