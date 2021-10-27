import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/content_height.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_abilities_tab.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_base_stats.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_evolutions.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_moves_tab.dart';

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
      top: screenHeight * tabbarPosition,
      child: Container(
        child: TabBarView(
          children: [
            PokemonBaseStats(
              stats: pokemon.stats,
            ),
            PokemonAbilitiesTab(
                abilities: pokemon.abilities, typeColors: typeColors),
            PokemonEvolutions(),
            PokemonMovesTab(moves: pokemon.moves, typeColors: typeColors),
          ],
        ),
      ),
    );
  }
}
