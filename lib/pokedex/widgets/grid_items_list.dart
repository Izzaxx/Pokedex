
import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/models/pokemon_model.dart';
import 'package:pokedex/pokedex/widgets/card_item_info.dart';

class GridItemsList extends StatelessWidget {

  final List<Pokemon> pokemons;

  const GridItemsList({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}