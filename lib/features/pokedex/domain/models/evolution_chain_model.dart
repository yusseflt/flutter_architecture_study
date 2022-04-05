import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:testing_ddd/features/pokedex/domain/models/chain.dart';

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
        chain: json["chain"] == null ? null : Chain.fromJson(json["chain"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "baby_trigger_item": babyTriggerItem,
        "chain": chain?.toJson(),
        "id": id,
      };

  @override
  List<Object?> get props => [babyTriggerItem, chain, id];
}
