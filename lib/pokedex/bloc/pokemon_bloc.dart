import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:pokedex/pokedex/models/pokemon_model.dart';
import 'package:pokedex/pokedex/services/pokedex_service.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  final PokedexService _pokedexService = PokedexService();

  PokemonBloc(PokedexService of) : super(PokemonLoadingProgress()) {
    on<PokemonEvent>((event, emit) async {
      emit(PokemonLoadingProgress());

      try {
        final pokemons = await _pokedexService.getPokemons();
        emit(
          PokemonSuccess(
            count: pokemons.count, 
            next: pokemons.next, 
            results: pokemons.results
          )
        );
      } catch (e) {
        emit(PokemonFaild(error: e as Error));
      }
    });
  }
}
