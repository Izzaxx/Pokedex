import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/pokedex/models/pokemon_details_model.dart';
import 'package:pokedex/pokedex/models/pokemon_model.dart';
import 'package:pokedex/pokedex/models/pokemon_search_model.dart';

import 'package:pokedex/utils/constants.dart';

class PokedexService {

  final client = http.Client();

  Future<PokemonResponse> getPokemons() async {

    final Map<String, dynamic> params = {'limit': limit};

    final uri = Uri.https(
      apiBaseUrl, 
      '/api/v2/pokemon', 
      params.map((key, value) => MapEntry(key, value.toString()))
    );

    final res = await client.get(uri);
    final json = jsonDecode(res.body);

    return PokemonResponse.fromJson(json);

  }

  Future<PokemonDetails> getPokemonDetails(int pokemonId) async {
    final uri = Uri.https(apiBaseUrl, '/api/v2/pokemon/$pokemonId');

    final res = await client.get(uri);
    final json = jsonDecode(res.body);

    return PokemonDetails.fromJson(json);
  }

  Future<List<PokemonSearch>?> getPokemonByName(String pokemonName) async {

    List<PokemonSearch> pokemonList = [];

    final uri = Uri.https(apiBaseUrl, '/api/v2/pokemon/$pokemonName');

    try {
      final res = await client.get(uri);
      final json = jsonDecode(res.body);

      pokemonList.add(PokemonSearch.fromJson(json));
      
      return pokemonList;
    } catch (e) {
      return null;
    }
  }


}