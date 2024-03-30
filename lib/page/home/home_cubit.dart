import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/network/repository/app_repository.dart';
import 'package:pokemon/network/response/pokemon_detail_response.dart';
import 'package:pokemon/network/response/pokemon_response.dart';
import 'package:pokemon/network/service/api_result.dart';
import 'package:pokemon/network/service/network_exceptions.dart';

import 'home.dart';

class HomeCubit extends Cubit<HomeState> {
  final AppRepository repository;
  int length = 20;
  HomeCubit({required this.repository}) : super(HomeInitial());

  void getData({required int pageKey}) async {
    emit(HomeInitial());
    int offsett = (pageKey - 1) * length;
    ApiResult<PokemonsResponse> result = await repository.pokemons(offsett);
    result.when(success: (PokemonsResponse response) async {
      int lastpage = response.results?.length ?? 0;
      final isLastPage = lastpage < 20;
      final nextPageKey = isLastPage ? null : pageKey + 1;
      emit(ListPokemon(
        itemList: response.results,
        nextPageKey: nextPageKey,
        error: null,
      ));
    }, failure: (NetworkExceptions error) {
      emit(ListPokemonFailure(error: NetworkExceptions.getErrorMessage(error)));
    });
  }

  void getDetail(String url) async {
    emit(HomeLoading());
    ApiResult<PokemonDetail> result = await repository.pokemon(url);
    result.when(success: (PokemonDetail response) async {
      emit(DetailPokemon(detail: response));
    }, failure: (NetworkExceptions error) {
      emit(HomeFailure(error: NetworkExceptions.getErrorMessage(error)));
    });
  }
}
