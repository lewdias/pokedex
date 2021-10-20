import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_stats.dart';

class PokemonBaseStats extends StatefulWidget {
  final List<PokemonStats> stats;
  const PokemonBaseStats({Key? key, required this.stats}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PokemonBaseStatsState();
}

class PokemonBaseStatsState extends State<PokemonBaseStats> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final double width = 10;
  double highestStat = 0.0;

  late List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final statBars = widget.stats.mapIndexed((int index, PokemonStats item) {
      if (item.baseStat.toDouble() > highestStat) {
        highestStat = item.baseStat.toDouble();
      }
      return makeGroupData(index, item.baseStat.toDouble(), item.stat.color);
    }).toList();

    showingBarGroups = statBars;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        height: screenHeight * 0.52,
        color: Colors.white,
        child: AspectRatio(
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
                        maxY: highestStat * 1.3,
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
                              } else if (value == 40) {
                                return '40';
                              } else if (value == 80) {
                                return '80';
                              } else if (value == 120) {
                                return '120';
                              } else if (value == 160) {
                                return '160';
                              } else if (value == 200) {
                                return '200';
                              } else if (value == 240) {
                                return '240';
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
                ],
              ),
            ),
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
