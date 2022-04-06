import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rxdart/subjects.dart';
import 'package:testing_ddd/core/util/pre_loader.dart';
import 'package:testing_ddd/features/pokedex/domain/models/pokedex_model.dart';
import 'package:testing_ddd/features/pokedex/infrastructure/repositories/http_pokedex_repository.dart';

class PokedexBloc {
  late PublishSubject pokedexSubject;
  Stream get stream => pokedexSubject.stream;

  HttpPokedexRepository apiRepository = HttpPokedexRepository(
    networkInfo: PreLoader.networkInfo,
    pokedexLocalDataSource: PreLoader.pokedexLocalDataSource,
    pokedexRemoteDataSource: PreLoader.pokedexRemoteDataSource,
  );
  String? nextUrl;
  int page = 0;

  final PagingController<int, PokedexPokemonModel> pagingController =
      PagingController(firstPageKey: 0);

  PokedexBloc() {
    pokedexSubject = PublishSubject();
  }

  Future fetchPokedex({bool next = false}) async {
    final result =
        await apiRepository.getPokedexList(nextUrl: next ? nextUrl : null);

    result.fold((failure) {
      pokedexSubject.addError("Erro");
    }, (pokedexModel) {
      List<PokedexPokemonModel> pokemons = pokedexModel.results;
      nextUrl = pokedexModel.next;
      if (pokemons.length < 20) {
        pagingController.appendLastPage(pokemons);
      } else {
        pagingController.appendPage(pokemons, page);
      }

      page++;
    });
  }
}
