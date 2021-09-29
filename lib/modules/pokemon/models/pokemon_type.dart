import 'package:flutter/material.dart';
import 'package:pokedex_4fun/config/constants/types_colors.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';

class PokemonType {
  int slot;
  PokemonTypeProperties type;

  PokemonType({
    required this.slot,
    required this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      type: PokemonTypeProperties.fromJson(json['type']),
    );
  }
}

class PokemonTypeProperties {
  String name;
  String url;
  PokemonTypeColors colors;

  PokemonTypeProperties({
    required this.name,
    required this.url,
    required this.colors,
  });

  factory PokemonTypeProperties.fromJson(Map<String, dynamic> type) {
    return PokemonTypeProperties(
      name: type['name'],
      url: type['url'],
      colors:
          PokemonTypeColors.fromJson(typeColor[type['name']] ?? defaultColor),
    );
  }
}

class PokemonTypeColors {
  Color defaultColor;
  Color lightColor;
  Color darkColor;

  PokemonTypeColors({
    required this.defaultColor,
    required this.lightColor,
    required this.darkColor,
  });

  factory PokemonTypeColors.fromJson(Map<String, String> item) {
    return PokemonTypeColors(
      defaultColor: getColorFromHex(item['defaultColor']),
      lightColor: getColorFromHex(item['lightColor']),
      darkColor: getColorFromHex(item['lightColor']),
    );
  }
}
