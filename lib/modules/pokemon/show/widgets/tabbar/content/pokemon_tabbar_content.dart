import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/show/widgets/tabbar/content/pokemon_base_stats.dart';
import 'package:pokedex_4fun/modules/pokemon/show/widgets/tabbar/content/pokemon_evolutions.dart';
import 'package:pokedex_4fun/modules/pokemon/show/widgets/tabbar/content/pokemon_moves.dart';

class PokemonTabbarContent extends StatelessWidget {
  const PokemonTabbarContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 385,
      child: Container(
        child: TabBarView(
          children: [
            PokemonBaseStats(),
            PokemonEvolutions(),
            PokemonMoves(),
          ],
        ),
      ),
    );
  }
}
