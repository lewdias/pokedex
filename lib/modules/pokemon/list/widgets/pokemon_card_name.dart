import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';
import 'package:pokedex_4fun/utils/outlinedText.dart';

class PokemonCardName extends StatelessWidget {
  final String pokemonName;
  final String pokemonId;
  final Map<String, String?>? pokemonTypeColors;

  const PokemonCardName({
    Key? key,
    required this.pokemonName,
    required this.pokemonId,
    required this.pokemonTypeColors,
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
                strokeColor: getColorFromHex(pokemonTypeColors?['color']),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
