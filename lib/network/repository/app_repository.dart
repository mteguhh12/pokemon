import 'package:pokemon/network/repository/base_repository.dart';
import 'package:pokemon/network/response/pokemon_detail_response.dart';
import 'package:pokemon/network/response/pokemon_response.dart';
import 'package:pokemon/network/response/species_response.dart';
import 'package:pokemon/network/service/api_result.dart';
import 'package:pokemon/network/service/app_client.dart';

class AppRepository extends BaseRepository {
  Future<ApiResult<PokemonsResponse>> pokemons(int offset) async {
    try {
      PokemonsResponse response = await appClient.pokemons(offset);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<PokemonDetail>> pokemon(String url) async {
    try {
      PokemonDetail response = await appClient.pokemon(url);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }

  Future<ApiResult<SpeciesResponse>> species(String url) async {
    try {
      SpeciesResponse response = await appClient.species(url);
      return ApiResult.success(data: response);
    } catch (e) {
      return handleErrorApi(e);
    }
  }
}
