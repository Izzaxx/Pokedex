import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/pages/pokedex_details_page.dart';

class CardItemInfo extends StatelessWidget {

  final int id;
  final String name;
  final String image;

  const CardItemInfo({
    Key? key,
    required this.id,
    required this.name,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => PokedexDetailsPage(
              id: id,
              name: name,
              image: image
            )
          )
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 200.0,
          child: GridTile(
            child: Column(
              children: [
                Hero(
                  tag: image,
                  child: Image.network(image)
                ),
                Text(name, style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),)
              ],
            )
          )
        )
      ),
    );
  }
}