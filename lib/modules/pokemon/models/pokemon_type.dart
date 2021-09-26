import 'package:pokedex_4fun/config/constants/types_colors.dart';

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
  String defaultColor;
  String lightColor;
  String darkColor;

  PokemonTypeColors({
    required this.defaultColor,
    required this.lightColor,
    required this.darkColor,
  });

  factory PokemonTypeColors.fromJson(Map<String, String> item) {
    return PokemonTypeColors(
      defaultColor: item['defaultColor'] ?? '',
      lightColor: item['lightColor'] ?? '',
      darkColor: item['darkColor'] ?? '',
    );
  }
}
