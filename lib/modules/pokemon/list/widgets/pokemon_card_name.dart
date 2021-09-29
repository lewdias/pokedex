import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';

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
          child: Text(
            'N°$pokemonId',
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Text(
            pokemonName,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
          ),
        ),
      ],
    );
  }
}
