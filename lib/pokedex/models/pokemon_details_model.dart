
class PokemonDetails {

  PokemonDetails({
    required this.abilitiesLen,
    required this.abilities,
    required this.movesLen,
    required this.moves
  });

  int abilitiesLen;
  List<String> abilities;
  int movesLen;
  List<String> moves;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    final abilities = List<String>.from((json["abilities"] as List).map((x) => x['ability']['name']));
    final abilitiesLen = abilities.length;
    final moves = List<String>.from((json["moves"] as List).map((x) => x['move']['name']));
    final movesLen = moves.length;

    return PokemonDetails(
      abilitiesLen: abilitiesLen,
      abilities: abilities,
      moves: moves,
      movesLen: movesLen
    );
  }

}