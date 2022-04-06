import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_ddd/core/util/constants.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';

abstract class PokedexLocalDataSourceInterface {
  /// Get local pokedex data from database

  Future<Map<String, dynamic>> getPokedexList();

  /// Cache pokedex data
  Future<void> cachePokedexData(PokedexModel pokedexModel);
}

class PokedexLocalDataSource extends PokedexLocalDataSourceInterface {
  final SharedPreferences sharedPreferences;

  PokedexLocalDataSource({required this.sharedPreferences});

  @override
  Future<Map<String, dynamic>> getPokedexList() async {
    final jsonString =
        sharedPreferences.getString(Constants.CACHE_POKEDEX_DATA);
    if (jsonString != null) {
      return json.decode(jsonString);
    } else {
      throw "Erro";
    }
  }

  @override
  Future<void> cachePokedexData(PokedexModel pokedexModel) async {
    await sharedPreferences.setString(
        Constants.CACHE_POKEDEX_DATA, json.encode(pokedexModel.toJson()));
  }
}
