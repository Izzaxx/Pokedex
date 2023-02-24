import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/pokedex/bloc/pokemon_bloc.dart';
import 'package:pokedex/pokedex/pages/pokedex_home_page.dart';
import 'package:pokedex/pokedex/services/pokedex_service.dart';
import 'package:pokedex/utils/constants.dart';

class Pokedex extends StatelessWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: primaryColor, secondary: secondaryColor)),
      home: RepositoryProvider(
        create: (context) => PokedexService(),
        child: BlocProvider(
          create: (context) => PokemonBloc(
              RepositoryProvider.of<PokedexService>(context),
            )..add(PokemonLoadedEvent()),
          child: const PokedexHomePage(),
        ),
      )
    );
  }
}