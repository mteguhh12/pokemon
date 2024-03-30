import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/network/repository/app_repository.dart';
import 'package:pokemon/network/response/species_response.dart';
import 'package:pokemon/network/service/api_result.dart';
import 'package:pokemon/network/service/network_exceptions.dart';

import 'detail.dart';

class DetailCubit extends Cubit<DetailState> {
  final AppRepository repository;
  SpeciesResponse? species;
  DetailCubit({required this.repository}) : super(DetailInitial());

  void getDetail(String url) async {
    emit(DetailLoading());
    ApiResult<SpeciesResponse> result = await repository.species(url);
    result.when(success: (SpeciesResponse response) async {
      species = response;

      emit(DetailSuccess());
    }, failure: (NetworkExceptions error) {
      emit(DetailFailure(error: NetworkExceptions.getErrorMessage(error)));
    });
  }
}
