import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_ddd/core/util/network_info.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/datasources/pokedex_local_data_source.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/datasources/pokedex_remote_data_source.dart';

class PreLoader extends ChangeNotifier {
  static final PreLoader _instance = PreLoader._();
  PreLoader._();

  static bool initiated = false;
  static ImageProvider? loadingGif;
  static late PokedexLocalDataSource pokedexLocalDataSource;
  static late PokedexRemoteDataSource pokedexRemoteDataSource;
  static late SharedPreferences sharedPreferences;
  static late NetworkInfo networkInfo;

  factory PreLoader() {
    return _instance;
  }

  static Future<void> init() async {
    loadingGif = const AssetImage("assets/gif/pikachu_loading.gif");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    sharedPreferences = prefs;
    pokedexLocalDataSource =
        PokedexLocalDataSource(sharedPreferences: sharedPreferences);

    pokedexRemoteDataSource = PokedexRemoteDataSource();
    networkInfo = NetworkInfo();
  }
}
