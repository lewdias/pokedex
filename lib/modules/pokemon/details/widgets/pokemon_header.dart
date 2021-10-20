import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_type.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';

class PokemonHeader extends StatelessWidget {
  final PokemonInfo pokemon;
  const PokemonHeader({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: screenHeight * 0.12,
      width: screenWidth,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${pokemon.name}',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    '#${pokemon.id}',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: pokemon.types
                  .mapIndexed(
                    (int index, PokemonType type) => PokemonCardType(
                      pokemonType: type,
                      index: index,
                      color: pokemon.types[0].type.colors.defaultColor
                          .withAlpha(255),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
