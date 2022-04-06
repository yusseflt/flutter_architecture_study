import 'package:dartz/dartz.dart';
import 'package:rxdart/rxdart.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_details_model.dart';
import 'package:testing_ddd/core/err/failure.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokemon_species_model.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/repositories/http_pokemon_details_repository.dart';

class PokemonDetailsBloc {
  late PublishSubject pokemonDetailsSubject;
  Stream get stream => pokemonDetailsSubject.stream;
  HttpPokemonDetailsRepository apiRepository = HttpPokemonDetailsRepository();

  PokemonDetailsBloc() {
    pokemonDetailsSubject = PublishSubject();
  }

  Future fetchPokemonDetails(int pokemonId) async {
    late Either<Failure, PokemonDetailsModel> resultPokemonDetails;
    late Either<Failure, PokemonSpeciesModel> resultPokemonSpecies;

    await Future.wait([
      (() async => resultPokemonDetails =
          await apiRepository.getPokemonDetails(pokemonId: pokemonId))(),
      (() async => resultPokemonSpecies =
          await apiRepository.getPokemonSpecies(pokemonId: pokemonId))(),
    ]);

    Map<String, dynamic> response = {};

    resultPokemonDetails.fold(
      (failure) {
        pokemonDetailsSubject.addError("Deu erro");
      },
      (pokemonDetails) {
        response.addAll({"pokemonDetails": pokemonDetails});
      },
    );

    resultPokemonSpecies.fold(
      (failure) {
        pokemonDetailsSubject.addError("Deu erro");
      },
      (pokemonSpecies) async {
        response.addAll({"pokemonSpecies": pokemonSpecies});
      },
    );

    pokemonDetailsSubject.sink.add(response);
  }

  Future fetchPokemonEvolutionChain(String url) async {
    var resultEvolutionChain =
        await apiRepository.getPokemonEvolutionChain(url: url);

    resultEvolutionChain.fold(
      (failure) {
        pokemonDetailsSubject.addError("Deu erro");
      },
      (evolutionChain) {},
    );
  }
}
