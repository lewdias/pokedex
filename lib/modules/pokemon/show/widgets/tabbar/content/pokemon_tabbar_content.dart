import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/show/widgets/tabbar/content/pokemon_base_stats.dart';
import 'package:pokedex_4fun/modules/pokemon/show/widgets/tabbar/content/pokemon_evolutions.dart';
import 'package:pokedex_4fun/modules/pokemon/show/widgets/tabbar/content/pokemon_moves.dart';

class PokemonTabbarContent extends StatelessWidget {
  final PokemonInfo pokemon;
  const PokemonTabbarContent({Key? key, required this.pokemon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 385,
      child: Container(
        child: TabBarView(
          children: [
            PokemonBaseStats(
              stats: pokemon.stats,
            ),
            PokemonEvolutions(),
            PokemonMoves(),
          ],
        ),
      ),
    );
  }
}
