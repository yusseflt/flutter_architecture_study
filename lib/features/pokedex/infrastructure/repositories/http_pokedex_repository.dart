import 'package:dartz/dartz.dart';
import 'package:testing_ddd/core/err/failure.dart';
import 'package:testing_ddd/core/util/network_info.dart';
import 'package:testing_ddd/features/pokedex/domain/err/pokedex_failure.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/datasources/pokedex_local_data_source.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/datasources/pokedex_remote_data_source.dart';

abstract class PokedexRepository {
  Future<Either<Failure, PokedexModel>> getPokedexList({String? nextUrl});
}

class HttpPokedexRepository implements PokedexRepository {
  final PokedexRemoteDataSource pokedexRemoteDataSource;
  final PokedexLocalDataSource pokedexLocalDataSource;
  final NetworkInfo networkInfo;

  HttpPokedexRepository({
    required this.pokedexLocalDataSource,
    required this.pokedexRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PokedexModel>> getPokedexList(
      {String? nextUrl}) async {
    if (await networkInfo.isConnected) {
      try {
        Map<String, dynamic> json =
            await pokedexRemoteDataSource.getPokedexList(nextUrl: nextUrl);

        PokedexModel pokedexModel = PokedexModel.fromJson(json);
        pokedexLocalDataSource.cachePokedexData(pokedexModel);
        return Right(pokedexModel);
      } catch (e) {
        return Left(PokedexFailure());
      }
    } else {
      try {
        Map<String, dynamic> json =
            await pokedexLocalDataSource.getPokedexList();
        return Right(PokedexModel.fromJson(json));
      } catch (e) {
        return Left(PokedexFailure());
      }
    }
  }
}
