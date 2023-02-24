
import 'package:pokedex/utils/constants.dart';

class PokemonSearch {

  PokemonSearch({
    required this.id,
    required this.name,
    required this.image
  });

  int id;
  String name;
  String image;

  factory PokemonSearch.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    return PokemonSearch(
      id: id,
      name: json["name"],
      image: '$pokemonsprints$id.png'
    );
  }

}