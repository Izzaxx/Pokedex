part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadingProgress extends PokemonState {

  List<Pokemon> get props => [];

}

class PokemonSuccess extends PokemonState {

  final int count;
  final String next;
  final List<Pokemon> results;

  PokemonSuccess({
    required this.count,
    required this.next,
    required this.results
  });

  List<Pokemon> get props => results;

}

class PokemonFaild extends PokemonState {
  final Error error;

  PokemonFaild({required this.error});
}
