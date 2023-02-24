
import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/models/pokemon_search_model.dart';
import 'package:pokedex/pokedex/services/pokedex_service.dart';
import 'package:pokedex/pokedex/widgets/card_item_info.dart';
import 'package:pokedex/pokedex/widgets/loading_progress.dart';
import 'package:pokedex/utils/constants.dart';

class PokedexSearch extends SearchDelegate {

  final PokedexService _pokedexService = PokedexService();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        }, 
        icon: const Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _pokedexService.getPokemonByName(query.toLowerCase()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingProgress();
        } else if (snapshot.connectionState == ConnectionState.done) {
          final List<PokemonSearch> pokemons = snapshot.data ?? [];
          if (pokemons.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                itemCount: pokemons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return CardItemInfo(
                    id: pokemons[index].id,
                    name: pokemons[index].name,
                    image: pokemons[index].image,
                  );
                },
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(20.0),
              child: Center(child: Text('No existe algun pokemon con ese nombre', style: textStyle,)),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }



}