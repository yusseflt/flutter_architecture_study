import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing_ddd/core/util/network_info.dart';
import 'package:testing_ddd/features/pokedex/domain/err/pokedex_failure.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/datasources/pokedex_local_data_source.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/datasources/pokedex_remote_data_source.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/repositories/http_pokedex_repository.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockPokedexRemoteDataSource extends Mock
    implements PokedexRemoteDataSourceInterface {}

class MockPokedexLocalDataSource extends Mock
    implements PokedexLocalDataSourceInterface {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockPokedexRemoteDataSource mockPokedexRemoteDataSource;
  late MockPokedexLocalDataSource mockPokedexLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late HttpPokedexRepository repository;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockPokedexLocalDataSource = MockPokedexLocalDataSource();
    mockPokedexRemoteDataSource = MockPokedexRemoteDataSource();

    repository = HttpPokedexRepository(
      pokedexLocalDataSource: mockPokedexLocalDataSource,
      pokedexRemoteDataSource: mockPokedexRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("GetPokedexList,", () {
    Map<String, dynamic> jsonFixture =
        json.decode(fixture("pokedex_model_fixture.json"));
    group('Online,', () {
      setUp(() {
        registerFallbackValue(
          PokedexModel(count: 1, next: null, previous: null, results: []),
        );
        when(() => mockNetworkInfo.isConnected).thenAnswer(
          (invocation) async => true,
        );
      });
      test('Should return a PokedexModel from a HTTP Request and save on cache',
          () async {
        when(() => mockPokedexRemoteDataSource.getPokedexList()).thenAnswer(
          (invocation) async => jsonFixture,
        );
        when(() => mockPokedexLocalDataSource.cachePokedexData(any()))
            .thenAnswer((invocation) async => true);

        PokedexModel pokedexModel = PokedexModel.fromJson(jsonFixture);
        final result = await repository.getPokedexList();

        verify(() => mockNetworkInfo.isConnected);
        verify(() => mockPokedexRemoteDataSource.getPokedexList());

        expect(result, equals(Right(pokedexModel)));
      });

      test('Should return a PokedexFailure on a HTTP Request', () async {
        when(() => mockPokedexRemoteDataSource.getPokedexList()).thenThrow(
          (invocation) async => Response("Error", 400),
        );

        final result = await repository.getPokedexList();

        verify(() => mockNetworkInfo.isConnected);
        verify(() => mockPokedexRemoteDataSource.getPokedexList());

        expect(result, equals(Left(PokedexFailure())));
      });

      test('Should return a PokedexModel even if it has a cache error',
          () async {
        when(() => mockPokedexRemoteDataSource.getPokedexList()).thenAnswer(
          (invocation) async => jsonFixture,
        );
        when(() => mockPokedexLocalDataSource.cachePokedexData(any()))
            .thenAnswer((invocation) async => false);

        PokedexModel pokedexModel = PokedexModel.fromJson(jsonFixture);

        final result = await repository.getPokedexList();

        verify(() => mockNetworkInfo.isConnected);
        verify(() => mockPokedexRemoteDataSource.getPokedexList());

        expect(result, equals(Right(pokedexModel)));
      });
    });

    group('Offline,', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer(
          (invocation) async => false,
        );
      });

      test('Should return a PokedexModel from a applications cache', () async {
        when(() => mockPokedexLocalDataSource.getPokedexList())
            .thenAnswer((invocation) async => jsonFixture);

        PokedexModel pokedexModel = PokedexModel.fromJson(jsonFixture);
        final result = await repository.getPokedexList();

        verify(() => mockNetworkInfo.isConnected);
        verify(() => mockPokedexLocalDataSource.getPokedexList());

        expect(result, equals(Right(pokedexModel)));
      });

      test('Should return a PokedexFailure when trying to save on cache',
          () async {
        when(() => mockPokedexLocalDataSource.getPokedexList())
            .thenThrow((invocation) async => Exception());

        final result = await repository.getPokedexList();

        verify(() => mockNetworkInfo.isConnected);
        verify(() => mockPokedexLocalDataSource.getPokedexList());

        expect(result, equals(Left(PokedexFailure())));
      });
    });
  });
}
