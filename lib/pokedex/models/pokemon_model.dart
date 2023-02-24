
import 'package:pokedex/utils/constants.dart';

class PokemonResponse {
  PokemonResponse({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Pokemon> results;

  factory PokemonResponse.fromJson(Map<String, dynamic> json) => PokemonResponse(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<Pokemon>.from((json["results"] as List).map((x) => Pokemon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.url,
    required this.image
  });
  

  int id;
  String name;
  String url;
  String image;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return Pokemon(
      id: int.parse(url.split('/')[6]),
      name: json["name"],
      url: json["url"],
      image: '$pokemonsprints$id.png'
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}