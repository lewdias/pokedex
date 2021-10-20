import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info_abilities.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';

class PokemonAbilities extends StatefulWidget {
  final List<PokemonInfoAbilities> abilities;
  final PokemonTypeColors typeColors;
  const PokemonAbilities(
      {Key? key, required this.abilities, required this.typeColors})
      : super(key: key);

  @override
  State<PokemonAbilities> createState() => _PokemonAbilitiesState();
}

class _PokemonAbilitiesState extends State<PokemonAbilities> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 417,
        color: Colors.white,
        child: Column(
          children: widget.abilities
              .map(
                (PokemonInfoAbilities ability) => ExpansionTile(
                  title: Text(
                    ability.name,
                    style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  leading: Icon(Icons.offline_bolt,
                      color: widget.typeColors.defaultColor),
                  iconColor: widget.typeColors.defaultColor,
                  children: [ListTile(title: Text('IDK YET'))],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
