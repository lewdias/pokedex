import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';

class PokemonAccentCircle extends StatelessWidget {
  final PokemonTypeColors typeColors;

  const PokemonAccentCircle({Key? key, required this.typeColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned(
      top: screenHeight * 0.3,
      child: SizedBox(
        width: 170,
        height: 170,
        child: CircleAvatar(backgroundColor: typeColors.lightColor),
      ),
    );
  }
}
