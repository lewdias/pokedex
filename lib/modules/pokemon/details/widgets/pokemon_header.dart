import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_type.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/primary_font.dart';

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
                PrimaryFont(
                  text: '${pokemon.name}',
                  color: Colors.white,
                  size: 40,
                  fontWeight: FontWeight.w800,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: PrimaryFont(
                    text: '#${pokemon.id}',
                    color: Colors.white,
                    size: 18,
                    fontWeight: FontWeight.w400,
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
