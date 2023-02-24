
import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/models/pokemon_details_model.dart';
import 'package:pokedex/pokedex/services/pokedex_service.dart';
import 'package:pokedex/pokedex/widgets/loading_progress.dart';
import 'package:pokedex/utils/constants.dart';

class PokedexDetailsPage extends StatelessWidget {

  final int id;
  final String name;
  final String image;

  const PokedexDetailsPage({
    Key? key,
    required this.id,
    required this.name,
    required this.image
  }) : super(key: key);

  static final PokedexService _pokedexService = PokedexService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Hero(
                    tag: image, 
                    child: Image.network(image)
                  ),
                  Text(name, style: textStyle)
                ],
              ),
              FutureBuilder(
                future: _pokedexService.getPokemonDetails(id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingProgress();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    final PokemonDetails pokemon = snapshot.data as PokemonDetails;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Cantidad de habilidades: ${pokemon.abilitiesLen}", style: textStyle),
                        const Text("Habilidades:", style: textStyle),
                        // Expanded(
                        //   child: ListView(
                        //     children: pokemon.abilities.map((e) => Text(e)).toList(),
                        //   ),
                        // ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: pokemon.abilities.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: const Icon(Icons.book),
                              title:Text(pokemon.abilities[index])
                            );
                          },
                        ),
                        Text("Cantidad de Movimientos: ${pokemon.movesLen}", style: textStyle,),
                        const Text("Movimientos:", style: textStyle,),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: pokemon.moves.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: const Icon(Icons.donut_small),
                              title:Text(pokemon.moves[index])
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}