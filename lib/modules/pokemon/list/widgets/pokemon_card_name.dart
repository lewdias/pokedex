import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';
import 'package:pokedex_4fun/utils/outlinedText.dart';

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
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            'N°$pokemonId',
            style: GoogleFonts.pressStart2p(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text(
            pokemonName,
            style: GoogleFonts.pressStart2p(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w800,
              shadows: outlinedText(
                strokeColor:
                    getColorFromHex(primaryPokemonTypeColors.defaultColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
