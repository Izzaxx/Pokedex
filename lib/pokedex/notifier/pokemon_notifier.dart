
import 'package:pokedex/pokedex/services/pokedex_service.dart';

class PokemonNotifier {

  final PokedexService _pokedexService = PokedexService();

  void showPokemonDetails(int pokemonId) async {

    await _pokedexService.getPokemonDetails(pokemonId);

  }

}