import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_stats.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/stats/pokemon_stats_graph.dart';

class PokemonBaseStats extends StatelessWidget {
  final List<PokemonStats> stats;
  const PokemonBaseStats({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      color: Colors.white,
      child: PokemonStatsGraph(stats: stats),
    );
  }
}
