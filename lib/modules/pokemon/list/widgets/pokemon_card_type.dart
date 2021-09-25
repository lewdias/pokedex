import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/modules/pokemon/list/models/pokemon_type.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';

class PokemonCardType extends StatelessWidget {
  final PokemonType pokemonType;
  final int index;

  const PokemonCardType(
      {Key? key, required this.pokemonType, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(index > 0 ? 5 : 0, 10, 0, 0),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: getColorFromHex('${pokemonType.type.colors.defaultColor}'),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Text(
        '${pokemonType.type.name}'.toUpperCase(),
        style: GoogleFonts.pressStart2p(
          fontSize: 8,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
