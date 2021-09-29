import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_stats.dart';

class PokemonStatsGraph extends StatefulWidget {
  final List<PokemonStats> stats;
  const PokemonStatsGraph({Key? key, required this.stats}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PokemonStatsGraphState();
}

class PokemonStatsGraphState extends State<PokemonStatsGraph> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final double width = 10;

  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final statBars = widget.stats
        .mapIndexed((int index, PokemonStats item) => makeGroupData(
              index,
              item.baseStat.toDouble(),
              item.stat.color,
            ))
        .toList();

    showingBarGroups = statBars;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Expanded(
                child: BarChart(
                  BarChartData(
                    maxY: 300,
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: SideTitles(showTitles: false),
                      topTitles: SideTitles(showTitles: false),
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                        margin: 15,
                        getTitles: (stat) {
                          switch (stat.toInt()) {
                            case 0:
                              return 'HP';
                            case 1:
                              return 'Atk';
                            case 2:
                              return 'Def';
                            case 3:
                              return 'Sp. Atk';
                            case 4:
                              return 'Sp. Def';
                            case 5:
                              return 'Spd';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (context, value) => const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        margin: 8,
                        reservedSize: 28,
                        interval: 1,
                        getTitles: (value) {
                          if (value == 0) {
                            return '0';
                          } else if (value == 50) {
                            return '50';
                          } else if (value == 100) {
                            return '100';
                          } else if (value == 150) {
                            return '150';
                          } else if (value == 200) {
                            return '200';
                          } else if (value == 255) {
                            return '255';
                          } else {
                            return '';
                          }
                        },
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double value, Color color) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: value,
        colors: [color],
        width: width,
      ),
    ]);
  }
}
