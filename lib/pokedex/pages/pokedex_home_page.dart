
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokedex/models/pokemon_model.dart';
import 'package:pokedex/pokedex/pages/pokedex_search_page.dart';
import 'package:pokedex/pokedex/widgets/error_message.dart';
import 'package:pokedex/pokedex/widgets/grid_items_list.dart';
import 'package:pokedex/pokedex/widgets/loading_progress.dart';

class PokedexHomePage extends StatelessWidget {
  const PokedexHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokedex"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: PokedexSearch())
          )
        ],
      ),
      body: _body()
    );
  }

  Widget _body() {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (BuildContext context, state) {

        if (state is PokemonLoadingProgress) return const LoadingProgress();
        
        if (state is PokemonFaild) return ErrorMessage(message: state.error.toString());

        if (state is PokemonSuccess) {
          final List<Pokemon> pokemons = state.props;
          return GridItemsList(pokemons: pokemons);
        }
        
        return Container();
      },
    );
  }
}