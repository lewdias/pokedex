import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/pages/widgets/custom-appbar.dart';

class PokemonShowPage extends StatelessWidget {
  PokemonShowPage({Key? key, required this.pokemon}) : super(key: key);
  final PokemonInfo pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Center(child: Text(pokemon.name)),
      ),
    );
  }
}
