import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/primary_font.dart';

class PokemonCardType extends StatelessWidget {
  final PokemonType pokemonType;
  final Color? color;
  final Color? borderColor;
  final int index;

  const PokemonCardType(
      {Key? key,
      required this.pokemonType,
      this.color,
      this.borderColor,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(index > 0 ? 5 : 0, 10, 0, 0),
      padding: EdgeInsets.all(4),
      width: 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? pokemonType.type.colors.defaultColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: 1,
        ),
      ),
      child: PrimaryFont(
        text: '${pokemonType.type.name}'.toUpperCase(),
        color: Colors.white,
        size: 12,
      ),
    );
  }
}
