import 'package:equatable/equatable.dart';

abstract class DetailState extends Equatable {
  DetailState([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {
  @override
  String toString() => 'DetailLoading';
}

class DetailSuccess extends DetailState {
  @override
  String toString() => 'DetailSuccess';
}

class DetailFailure extends DetailState {
  final String? error;

  DetailFailure({this.error});

  @override
  String toString() => 'DetailFailure { error: $error }';
}
