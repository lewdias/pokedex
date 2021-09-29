import 'package:flutter/material.dart';
import 'package:pokedex_4fun/config/constants/stats_colors.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';

class PokemonStats {
  int baseStat;
  int ev;
  PokemonStat stat;

  PokemonStats({
    required this.baseStat,
    required this.ev,
    required this.stat,
  });

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    return PokemonStats(
      baseStat: json['base_stat'],
      ev: json['effort'],
      stat: PokemonStat.fromJson(json['stat']),
    );
  }
}

class PokemonStat {
  String name;
  String url;
  Color color;

  PokemonStat({
    required this.name,
    required this.url,
    required this.color,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      name: json['name'],
      url: json['url'],
      color: getColorFromHex(statsColors[json['name']]!['defaultColor']),
    );
  }
}
