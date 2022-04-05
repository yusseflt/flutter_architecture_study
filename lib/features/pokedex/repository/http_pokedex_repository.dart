import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:testing_ddd/core/err/failure.dart';
import 'package:testing_ddd/core/util/constants.dart';
import 'package:testing_ddd/features/pokedex/domain/err/pokedex_failure.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';
import 'package:http/http.dart' as http;

abstract class PokedexRepository {
  /// Get call to pokedex endpoint
  ///
  /// https://pokeapi.co/api/v2/pokemon/

  Future<Either<Failure, PokedexModel>> getPokedexList({String? nextUrl});
}

class HttpPokedexRepository implements PokedexRepository {
  @override
  Future<Either<Failure, PokedexModel>> getPokedexList(
      {String? nextUrl}) async {
    try {
      Uri uri = Uri.parse(nextUrl ?? "${Constants.BASE_URL}pokemon");
      var response = await http.get(uri);

      Map<String, dynamic> jsonResponse = json.decode(response.body);

      return Right(PokedexModel.fromJson(jsonResponse));
    } catch (e) {
      return Left(PokedexFailure());
    }
  }
}
