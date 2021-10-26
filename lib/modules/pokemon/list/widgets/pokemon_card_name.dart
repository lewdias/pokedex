import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/primary_font.dart';

class PokemonCardName extends StatelessWidget {
  final String pokemonName;
  final String pokemonId;
  final PokemonTypeColors primaryPokemonTypeColors;

  const PokemonCardName({
    Key? key,
    required this.pokemonName,
    required this.pokemonId,
    required this.primaryPokemonTypeColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: PrimaryFont(text: 'N°$pokemonId', color: Colors.white)),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: PrimaryFont(
            text: pokemonName,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
