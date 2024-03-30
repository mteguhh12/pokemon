import 'package:dio/dio.dart';
import 'package:pokemon/network/response/pokemon_detail_response.dart';
import 'package:pokemon/network/response/pokemon_response.dart';
import 'package:pokemon/network/response/species_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @GET("pokemon?offset={offset}&limit=20")
  Future<PokemonsResponse> pokemons(
    @Path("offset") int offset,
  );

  @GET("{url}")
  Future<PokemonDetail> pokemon(
    @Path("url") String url,
  );

  @GET("{url}")
  Future<SpeciesResponse> species(
    @Path("url") String url,
  );
}
