import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:testing_ddd/core/err/failure.dart';
import 'package:http/http.dart' as http;
import 'package:testing_ddd/core/util/constants.dart';
import 'package:testing_ddd/features/pokedex/domain/err/pokemon_details_failure.dart';
import 'package:testing_ddd/features/pokedex/domain/models/evolution_chain_model.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_details_model.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_species_model.dart';

abstract class PokemonDetailsRepository {
  /// Get call to pokemon details endpoint
  ///
  /// Ex: https://pokeapi.co/api/v2/pokemon/1

  Future<Either<Failure, PokemonDetailsModel>> getPokemonDetails(
      {required int pokemonId});

  /// Get call to pokemon species endpoint
  ///
  /// Ex: https://pokeapi.co/api/v2/pokemon-species/1

  Future<Either<Failure, PokemonSpeciesModel>> getPokemonSpecies(
      {required int pokemonId});

  /// Get call to pokemon evolution chain endpoint
  ///
  /// Ex: https://pokeapi.co/api/v2/evolution-chain/1

  Future<Either<Failure, EvolutionChainModel>> getPokemonEvolutionChain(
      {required String url});
}

class HttpPokemonDetailsRepository implements PokemonDetailsRepository {
  @override
  Future<Either<Failure, PokemonDetailsModel>> getPokemonDetails({
    required int pokemonId,
  }) async {
    try {
      Uri uri = Uri.parse("${Constants.BASE_URL}pokemon/$pokemonId");
      var response = await http.get(uri);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      return Right(PokemonDetailsModel.fromJson(jsonResponse));
    } catch (e) {
      return Left(PokemonDetailsFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonSpeciesModel>> getPokemonSpecies(
      {required int pokemonId}) async {
    try {
      Uri uri = Uri.parse("${Constants.BASE_URL}pokemon-species/$pokemonId");
      var response = await http.get(uri);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      return Right(PokemonSpeciesModel.fromJson(jsonResponse));
    } catch (e) {
      return Left(PokemonDetailsFailure());
    }
  }

  @override
  Future<Either<Failure, EvolutionChainModel>> getPokemonEvolutionChain(
      {required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      var response = await http.get(uri);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      return Right(EvolutionChainModel.fromJson(jsonResponse));
    } catch (e) {
      return Left(PokemonDetailsFailure());
    }
  }
}
