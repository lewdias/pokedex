import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_abilities.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_base_stats.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_evolutions.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_moves.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';

class PokemonTabbarContent extends StatelessWidget {
  final PokemonInfo pokemon;
  final PokemonTypeColors typeColors;
  const PokemonTabbarContent(
      {Key? key, required this.pokemon, required this.typeColors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Positioned.fill(
      top: screenHeight * 0.48,
      child: Container(
        child: TabBarView(
          children: [
            PokemonBaseStats(
              stats: pokemon.stats,
            ),
            PokemonAbilities(
                abilities: pokemon.abilities, typeColors: typeColors),
            PokemonEvolutions(),
            PokemonMoves(),
          ],
        ),
      ),
    );
  }
}
