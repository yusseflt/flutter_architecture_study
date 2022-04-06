import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testing_ddd/core/util/constants.dart';

abstract class PokedexRemoteDataSourceInterface {
  /// Get call to pokedex endpoint
  ///
  /// https://pokeapi.co/api/v2/pokemon/

  Future<Map<String, dynamic>> getPokedexList({String? nextUrl});
}

class PokedexRemoteDataSource extends PokedexRemoteDataSourceInterface {
  @override
  Future<Map<String, dynamic>> getPokedexList({String? nextUrl}) async {
    Uri uri = Uri.parse(nextUrl ?? "${Constants.BASE_URL}pokemon");
    var response = await http.get(uri);

    Map<String, dynamic> jsonResponse = json.decode(response.body);

    return jsonResponse;
  }
}
