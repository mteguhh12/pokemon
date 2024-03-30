import 'package:equatable/equatable.dart';
import 'package:pokemon/network/response/pokemon_detail_response.dart';
import 'package:pokemon/network/response/pokemon_response.dart';

abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {
  @override
  String toString() => 'BerandaHomeLoading';
}

class HomeSuccess extends HomeState {
  @override
  String toString() => 'HomeSuccess';
}

class HomeFailure extends HomeState {
  final String? error;

  HomeFailure({this.error});

  @override
  String toString() => 'HomeFailure { error: $error }';
}

class ListPokemon extends HomeState {
  final List<Pokemon>? itemList;
  final dynamic error;
  final int? nextPageKey;

  ListPokemon({
    this.itemList,
    this.error,
    this.nextPageKey = 0,
  });

  @override
  String toString() {
    return 'ListPokemon {itemList: $itemList, error: $error, nextPageKey: $nextPageKey}';
  }
}

class ListPokemonFailure extends HomeState {
  final String? error;

  ListPokemonFailure({this.error});

  @override
  String toString() => 'ListPokemonFailure { error: $error }';
}

class DetailPokemon extends HomeState {
  final PokemonDetail? detail;

  DetailPokemon({
    this.detail,
  });

  @override
  String toString() {
    return 'DetailPokemon {detail: $detail}';
  }
}
