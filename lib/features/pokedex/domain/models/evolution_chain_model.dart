import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/entities/chain.dart';
import 'package:testing_ddd/features/pokedex/domain/models/chain_model.dart';

EvolutionChainModel evolutionChainModelFromJson(String str) =>
    EvolutionChainModel.fromJson(json.decode(str));

String evolutionChainModelToJson(EvolutionChainModel data) =>
    json.encode(data.toJson());

// ignore: must_be_immutable
class EvolutionChainModel extends Equatable {
  EvolutionChainModel({
    this.babyTriggerItem,
    this.chain,
    this.id,
  });

  dynamic babyTriggerItem;
  Chain? chain;
  int? id;

  factory EvolutionChainModel.fromJson(Map<String, dynamic> json) =>
      EvolutionChainModel(
        babyTriggerItem: json["baby_trigger_item"],
        chain:
            json["chain"] == null ? null : ChainModel.fromJson(json["chain"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "baby_trigger_item": babyTriggerItem,
        "chain": (chain as ChainModel).toJson(),
        "id": id,
      };

  @override
  List<Object?> get props => [babyTriggerItem, chain, id];
}
