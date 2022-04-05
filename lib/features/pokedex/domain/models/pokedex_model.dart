import 'package:equatable/equatable.dart';

class PokedexModel extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<PokedexPokemonModel> results;

  const PokedexModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokedexModel.fromJson(Map<String, dynamic> json) => PokedexModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"]
            .map<PokedexPokemonModel>(
                (pokemon) => PokedexPokemonModel.fromJson(pokemon))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results,
      };

  @override
  List<Object?> get props => [count, next, previous, results];
}

class PokedexPokemonModel extends Equatable {
  final String name;
  final String url;

  const PokedexPokemonModel({required this.name, required this.url});

  factory PokedexPokemonModel.fromJson(Map<String, dynamic> json) =>
      PokedexPokemonModel(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  @override
  List<Object?> get props => [name, url];
}
