part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class PokemonLoadedEvent extends PokemonEvent {
  List<Pokemon> get props => [];
}